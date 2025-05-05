import asyncio
from playwright.async_api import async_playwright
from typing import List, Dict, Any
import json
from pathlib import Path
import logging
from rich.logging import RichHandler
from datetime import datetime
from config import Config

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(message)s",
    datefmt="[%X]",
    handlers=[RichHandler(rich_tracebacks=True)]
)
logger = logging.getLogger("test_framework")

class WebAppTestFramework:
    def __init__(self):
        self.base_url = Config.BASE_URL  # Use the base URL from config
        self.login_url = Config.LOGIN_URL  # Use the login URL from config
        self.dashboard_url = Config.DASHBOARD_URL  # Use the dashboard URL from config
        self.credentials = Config.CREDENTIALS  # Use credentials from config
        self.crawled_data: Dict[str, Any] = {
            "pages": {}
        }
        
    async def setup(self):
        """Initialize Playwright and browser"""
        self.playwright = await async_playwright().start()
        self.browser = await self.playwright.chromium.launch(
            headless=False,  # Run in non-headless mode
            slow_mo=1500,    # Add 1.5 second delay between actions for visibility
        )
        self.context = await self.browser.new_context(
            viewport={'width': 1280, 'height': 720}  # Set a good viewport size
        )
        self.page = await self.context.new_page()
        
    async def crawl_page(self, url: str, page_name: str):
        """Crawl a specific page and collect element data"""
        logger.info(f"Crawling {page_name} at {url}")
        
        try:
            await self.page.goto(url)
            
            # Collect all clickable elements
            clickable_elements = await self.page.query_selector_all("button, a, [role='button']")
            elements_data = []
            
            for element in clickable_elements:
                element_text = await element.text_content()
                element_tag = await element.get_property("tagName")
                element_tag_value = await element_tag.json_value()
                
                elements_data.append({
                    "text": element_text.strip() if element_text else "",
                    "tag": element_tag_value.lower(),
                    "selector": await element.evaluate("el => el.outerHTML")
                })
            
            # Collect all form elements
            form_elements = await self.page.query_selector_all("input, select, textarea")
            forms_data = []
            
            for element in form_elements:
                element_type = await element.get_attribute("type")
                element_name = await element.get_attribute("name")
                element_id = await element.get_attribute("id")
                
                forms_data.append({
                    "type": element_type,
                    "name": element_name,
                    "id": element_id,
                    "selector": await element.evaluate("el => el.outerHTML")
                })
            
            self.crawled_data["pages"][page_name] = {
                "url": url,
                "timestamp": datetime.now().isoformat(),
                "clickable_elements": elements_data,
                "form_elements": forms_data
            }
            
        except Exception as e:
            logger.error(f"Error during crawling {page_name}: {str(e)}")
            raise
            
    async def login(self):
        """Perform login to access dashboard"""
        logger.info("Performing login")
        
        try:
            await self.page.goto(self.login_url)
            
            # Wait for the form elements to be visible
            await self.page.wait_for_selector("input[name='email']", state="visible")
            await self.page.wait_for_selector("input[name='password']", state="visible")
            
            # Fill login form
            await self.page.fill("input[name='email']", self.credentials["username"])
            await self.page.fill("input[name='password']", self.credentials["password"])
            
            # More specific selector for the login button
            login_button = await self.page.wait_for_selector("button[type='submit']", state="visible")
            await login_button.click()
            
            # Wait for navigation to dashboard with updated URL
            await self.page.wait_for_url(self.dashboard_url, timeout=60000)  # Increased timeout to 60 seconds
            logger.info("Successfully logged in")
            
        except Exception as e:
            logger.error(f"Error during login: {str(e)}")
            raise
            
    def _save_crawled_data(self):
        """Save crawled data to a JSON file"""
        output_dir = Path("test_data")
        output_dir.mkdir(exist_ok=True)
        
        output_file = output_dir / "crawled_data.json"
        with open(output_file, "w") as f:
            json.dump(self.crawled_data, f, indent=2)
        
        logger.info(f"Crawled data saved to {output_file}")
        
    async def crawl_add_user_modal(self):
        """Crawl the Add User modal form elements"""
        logger.info("Crawling Add User modal")
        
        try:
            # Navigate to users page
            await self.page.goto(f"{self.base_url}/admin/users")
            
            # Click Add User button and wait for modal
            await self.page.wait_for_selector("button:has-text('Add User')")
            await self.page.click("button:has-text('Add User')")
            
            # Wait for modal animation
            await self.page.wait_for_timeout(2000)
            
            # Wait for and get the modal content - try different possible selectors
            modal_content = None
            for selector in [
                "div[role='dialog']",
                "div.modal",
                "div.modal-content",
                "div.dialog",
                "form.space-y-4",  # Try the form directly
            ]:
                try:
                    modal_content = self.page.locator(selector)
                    if await modal_content.count() > 0:
                        logger.info(f"Found modal with selector: {selector}")
                        break
                except:
                    continue
            
            if not modal_content:
                raise Exception("Could not find modal content with any known selector")
            
            # Get form elements
            form = modal_content.locator("form") if not selector.startswith("form") else modal_content
            
            # Get all inputs and selects
            elements_data = []
            
            # Get all input elements
            inputs = await form.locator("input, select").all()
            for input_el in inputs:
                tag_name = await input_el.evaluate("el => el.tagName.toLowerCase()")
                input_type = await input_el.get_attribute("type") or tag_name
                input_name = await input_el.get_attribute("name")
                input_id = await input_el.get_attribute("id")
                input_placeholder = await input_el.get_attribute("placeholder")
                input_class = await input_el.get_attribute("class")
                
                # Try to find associated label
                label_text = None
                if input_id:
                    label_el = form.locator(f"label[for='{input_id}']")
                    try:
                        label_text = await label_el.text_content()
                    except:
                        pass
                
                elements_data.append({
                    "type": input_type,
                    "name": input_name,
                    "id": input_id,
                    "placeholder": input_placeholder,
                    "class": input_class,
                    "label": label_text,
                    "selector": await input_el.evaluate("el => el.outerHTML")
                })
            
            # Store modal data
            self.crawled_data["add_user_modal"] = {
                "url": f"{self.base_url}/admin/users",
                "timestamp": datetime.now().isoformat(),
                "form_elements": elements_data
            }
            
            # Try to close modal with different possible buttons
            for close_selector in [
                "button:has-text('Close')",
                "button:has-text('Cancel')",
                "button[aria-label='Close']",
                ".modal-close"
            ]:
                close_button = modal_content.locator(close_selector)
                if await close_button.count() > 0:
                    await close_button.click()
                    break
            
        except Exception as e:
            logger.error(f"Error during crawling Add User modal: {str(e)}")
            raise

    async def crawl_application(self):
        """Crawl both login and dashboard pages"""
        try:
            # First crawl login page
            await self.crawl_page(self.login_url, "login")
            
            # Perform login
            await self.login()
            
            # Then crawl dashboard page
            await self.crawl_page(self.dashboard_url, "dashboard")
            
            # Crawl Add User modal
            await self.crawl_add_user_modal()
            
            # Save all crawled data
            self._save_crawled_data()
            
        except Exception as e:
            logger.error(f"Error during application crawling: {str(e)}")
            raise
            
    async def cleanup(self):
        """Cleanup Playwright resources"""
        await self.context.close()
        await self.browser.close()
        await self.playwright.stop()
        
async def main():
    framework = WebAppTestFramework()
    
    try:
        await framework.setup()
        await framework.crawl_application()
    finally:
        await framework.cleanup()

if __name__ == "__main__":
    asyncio.run(main()) 