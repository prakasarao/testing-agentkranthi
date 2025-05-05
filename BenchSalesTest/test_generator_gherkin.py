import json
from pathlib import Path
from typing import Dict, Any, List
import logging
from rich.logging import RichHandler
from datetime import datetime
from crawl4ai import AsyncWebCrawler
from playwright.async_api import async_playwright

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(message)s",
    datefmt="[%X]",
    handlers=[RichHandler(rich_tracebacks=True)]
)
logger = logging.getLogger("test_generator_gherkin")

# Gherkin template for feature files
GHERKIN_TEMPLATE = """Feature: {feature_name}
  As a user
  I want to interact with the {page_name}
  So that I can perform various actions

{scenarios}
"""

GHERKIN_SCENARIO_TEMPLATE = """  Scenario: {scenario_name}
    Given I am on the page "{url}"
{steps}
"""

class WebCrawlerIntegration:
    def __init__(self):
        self.crawler = AsyncWebCrawler()
        self.selectors_map = {}

    async def crawl_and_extract_selectors(self, url: str) -> Dict[str, str]:
        """Crawl page and extract dynamic selectors"""
        response = await self.crawler.crawl(url)
        
        # Extract selectors from the response
        selectors = self.extract_selectors(response.content)
        
        # Store selectors for later use
        self.selectors_map[url] = selectors
        return selectors

    def extract_selectors(self, content: str) -> Dict[str, str]:
        """Extract dynamic selectors from page content"""
        # Implementation to extract selectors
        return {
            "login_button": "button[type='submit']",
            "search_input": "input[name='search']",
            # Add more selectors as needed
        }

class GherkinTestGenerator:
    def __init__(self):
        self.test_data_dir = Path("test_data")
        self.output_dir = Path("generated_tests")
        self.output_dir.mkdir(exist_ok=True)
        self.credentials = {
            "username": "superuser@edvenswatech.com",
            "password": "admin123"
        }
        self.crawled_data = {"pages": {}}
        
    def load_test_scenarios(self) -> Dict[str, Any]:
        """Load test scenarios from the JSON file"""
        scenarios_file = self.test_data_dir / "crawled_data.json"
        if not scenarios_file.exists():
            raise FileNotFoundError("Crawled data file not found. Run the crawler first.")
            
        with open(scenarios_file) as f:
            self.crawled_data = json.load(f)
            return self.crawled_data
            
    def generate_json_test_case(self, element: Dict[str, Any], page_name: str, is_login: bool = False) -> Dict[str, Any]:
        """Generate JSON test case format"""
        if is_login:
            return {
                "name": "Login Test",
                "page": "Login Page",
                "url": "https://qhire.edvenswatech.com/login",
                "credentials": self.credentials,
                "steps": [
                    {
                        "action": "enter_text",
                        "element": "input[name='email']",
                        "value": self.credentials["username"]
                    },
                    {
                        "action": "enter_text",
                        "element": "input[name='password']",
                        "value": self.credentials["password"]
                    },
                    {
                        "action": "click",
                        "element": "button[type='submit']"
                    }
                ],
                "expected_url": "https://qhire.edvenswatech.com/admin/dashboard"
            }
            
        test_case = {
            "name": f"Test {element.get('tag', 'element')} interaction",
            "page": f"{page_name.replace('_', ' ').title()} Page",
            "url": self.crawled_data["pages"][page_name]["url"],
            "steps": []
        }
        
        if element.get("type") in ["text", "email", "password"]:
            test_case["steps"].append({
                "action": "enter_text",
                "element": element["selector"],
                "value": element.get("test_value", "test@example.com")
            })
        elif element.get("type") == "checkbox":
            test_case["steps"].append({
                "action": "click",
                "element": element["selector"]
            })
        elif element.get("type") == "select":
            test_case["steps"].append({
                "action": "select",
                "element": element["selector"],
                "value": "First Option"
            })
        else:
            test_case["steps"].append({
                "action": "click",
                "element": element["selector"]
            })
            
        return test_case
        
    def generate_gherkin_feature_by_page(self, test_cases: List[Dict[str, Any]], page_name: str) -> str:
        """Generate Gherkin feature file content for a specific page"""
        feature_content = GHERKIN_TEMPLATE.format(
            feature_name=f"{page_name} Test Suite",
            page_name=page_name.lower(),
            scenarios=""
        )
        
        for test_case in test_cases:
            if test_case["page"] == f"{page_name}":
                scenario = f"""  Scenario: {test_case['name']}
    Given I am on the page "{test_case['url']}"
"""
                
                for step in test_case["steps"]:
                    if step["action"] == "enter_text":
                        scenario += f'    When I enter "{step["value"]}" into "{step["element"]}"\n'
                        scenario += f'    Then the input should be filled\n'
                    elif step["action"] == "click":
                        scenario += f'    When I click on the element "{step["element"]}"\n'
                        scenario += f'    Then the element should be clicked\n'
                    elif step["action"] == "select":
                        scenario += f'    When I select "{step["value"]}" from "{step["element"]}"\n'
                        scenario += f'    Then the option should be selected\n'
                        
                if "expected_url" in test_case:
                    scenario += f'    Then I should be redirected to "{test_case["expected_url"]}"\n'
                    
                feature_content += scenario + "\n"
            
        return feature_content
        
    def generate_tests(self):
        """Generate both Gherkin and JSON format test cases"""
        self.crawled_data = self.load_test_scenarios()
        
        # Initialize test cases dictionary by page
        test_cases_by_page = {
            "Login Page": [self.generate_json_test_case({}, "login", is_login=True)],
            "Dashboard Page": []
        }
        
        # Process each page
        for page_name, page_data in self.crawled_data["pages"].items():
            current_page = "Login Page" if page_name == "login" else "Dashboard Page"
            
            if page_name == "login":
                continue  # Skip login page elements since we have a special login test
                
            # Process clickable elements
            for element in page_data["clickable_elements"]:
                test_cases_by_page[current_page].append(
                    self.generate_json_test_case(element, page_name)
                )
                
            # Process form elements
            for element in page_data["form_elements"]:
                test_cases_by_page[current_page].append(
                    self.generate_json_test_case(element, page_name)
                )
        
        # Generate and append Gherkin feature files by page
        gherkin_file = self.output_dir / "web_app_tests.feature"
        with open(gherkin_file, "a") as f:
            f.write(f"\n# New Test Cases Generated at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            
            # Generate features for each page
            for page_name, page_tests in test_cases_by_page.items():
                if page_tests:  # Only generate if there are tests for this page
                    feature_content = self.generate_gherkin_feature_by_page(page_tests, page_name)
                    f.write(f"\n# {page_name} Test Cases\n")
                    f.write(feature_content)
        
        logger.info(f"Appended to Gherkin feature file: {gherkin_file}")
        
        # Load existing JSON test cases if any
        json_file = self.output_dir / "test_cases.json"
        existing_data = {}
        if json_file.exists():
            with open(json_file) as f:
                try:
                    existing_data = json.load(f)
                except json.JSONDecodeError:
                    logger.warning("Could not read existing JSON file, creating new one")
        
        # Prepare new data structure
        new_data = {
            "timestamp": datetime.now().isoformat(),
            "base_url": "https://qhire.edvenswatech.com",
            "test_suites": []
        }
        
        # Add test suites by page
        for page_name, page_tests in test_cases_by_page.items():
            if page_tests:  # Only add if there are tests for this page
                new_data["test_suites"].append({
                    "name": page_name,
                    "test_cases": page_tests
                })
        
        # Merge with existing data if needed
        if "test_suites" in existing_data:
            # Add timestamp for the update
            new_data["previous_runs"] = existing_data.get("previous_runs", [])
            new_data["previous_runs"].append({
                "timestamp": existing_data["timestamp"],
                "test_suites": existing_data["test_suites"]
            })
        
        # Save merged JSON test cases
        with open(json_file, "w") as f:
            json.dump(new_data, f, indent=2)
            
        logger.info(f"Updated JSON test cases file: {json_file}")
        
class TestExecutor:
    def __init__(self, selectors_map: Dict[str, str]):
        self.selectors_map = selectors_map

    async def execute_test(self, test_script: str, url: str):
        """Execute Playwright test with dynamic selectors"""
        async with async_playwright() as p:
            browser = await p.chromium.launch()
            page = await browser.new_page()
            
            # Replace placeholder selectors with dynamic ones
            test_script = self.replace_selectors(test_script, url)
            
            # Execute the test
            await eval(test_script)
            
            await browser.close()

    def replace_selectors(self, test_script: str, url: str) -> str:
        """Replace placeholder selectors with dynamic ones"""
        selectors = self.selectors_map.get(url, {})
        for placeholder, selector in selectors.items():
            test_script = test_script.replace(f"{{selector_{placeholder}}}", selector)
        return test_script

def main():
    generator = GherkinTestGenerator()
    generator.generate_tests()
    
if __name__ == "__main__":
    main() 