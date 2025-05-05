import json
from pathlib import Path
from typing import Dict, Any, List
import logging
from rich.logging import RichHandler
from jinja2 import Template

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(message)s",
    datefmt="[%X]",
    handlers=[RichHandler(rich_tracebacks=True)]
)
logger = logging.getLogger("test_generator")

# Test template for Playwright
TEST_TEMPLATE = '''
import pytest
from playwright.sync_api import Page, expect

{% for test in tests %}
def test_{{ test.name }}(page: Page):
    # {{ test.description }}
    # Navigate to the page
    page.goto("{{ test.url }}")
    
    {% if test.type == 'click_test' %}
    # Find and click the element
    element = page.locator("""{{ test.selector }}""")
    expect(element).to_be_visible()
    element.click()
    
    {% elif test.type == 'form_test' %}
    # Find and interact with the form element
    element = page.locator("""{{ test.selector }}""")
    expect(element).to_be_visible()
    {% if test.element_type == 'text' or test.element_type == 'email' %}
    element.fill("test_value")
    {% elif test.element_type == 'checkbox' %}
    element.check()
    {% elif test.element_type == 'select' %}
    element.select_option(label="First Option")
    {% endif %}
    
    {% endif %}
    # Add assertions based on expected behavior
    # TODO: Add specific assertions for this test case
    
{% endfor %}
'''

class PlaywrightTestGenerator:
    def __init__(self):
        self.test_data_dir = Path("test_data")
        self.output_dir = Path("generated_tests")
        self.template = Template(TEST_TEMPLATE)
        
    def load_test_scenarios(self) -> List[Dict[str, Any]]:
        """Load test scenarios from the JSON file"""
        scenarios_file = self.test_data_dir / "test_scenarios.json"
        if not scenarios_file.exists():
            raise FileNotFoundError("Test scenarios file not found. Run the crawler first.")
            
        with open(scenarios_file) as f:
            return json.load(f)
            
    def generate_test_name(self, scenario: Dict[str, Any]) -> str:
        """Generate a valid Python test function name"""
        if scenario["type"] == "click_test":
            element_text = scenario["element"]["text"]
            return f"click_{element_text.lower().replace(' ', '_')}"[:50]
        else:
            element_type = scenario["element"]["type"]
            element_id = scenario["element"]["id"] or scenario["element"]["name"]
            return f"form_{element_type}_{element_id}"[:50]
            
    def generate_tests(self):
        """Generate Playwright test files from scenarios"""
        scenarios = self.load_test_scenarios()
        
        # Prepare output directory
        self.output_dir.mkdir(exist_ok=True)
        
        # Group scenarios by type
        click_tests = [s for s in scenarios if s["type"] == "click_test"]
        form_tests = [s for s in scenarios if s["type"] == "form_test"]
        
        # Generate click tests
        if click_tests:
            self._generate_test_file("test_clicks.py", click_tests)
            
        # Generate form tests
        if form_tests:
            self._generate_test_file("test_forms.py", form_tests)
            
    def _generate_test_file(self, filename: str, scenarios: List[Dict[str, Any]]):
        """Generate a single test file from scenarios"""
        tests = []
        for scenario in scenarios:
            test_case = {
                "name": self.generate_test_name(scenario),
                "description": scenario["description"],
                "type": scenario["type"],
                "url": scenario["element"].get("url", ""),
                "selector": scenario["element"]["selector"],
                "element_type": scenario["element"].get("type", "")
            }
            tests.append(test_case)
            
        # Render template
        test_content = self.template.render(tests=tests)
        
        # Save test file
        output_file = self.output_dir / filename
        with open(output_file, "w") as f:
            f.write(test_content)
            
        logger.info(f"Generated test file: {output_file}")
        
def main():
    generator = PlaywrightTestGenerator()
    generator.generate_tests()
    
if __name__ == "__main__":
    main() 