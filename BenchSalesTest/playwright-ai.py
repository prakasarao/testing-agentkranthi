from playwright.sync_api import sync_playwright
import time
from ai_wrapper import AIWrapper
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Keep only essential configuration that can't be handled by AI
LOGIN_PAGE_URL = "https://preview.athenahealth.com/1/2/login.esp"
INFER_HCC_EXTENSION_PATH = "/Users/edvenswa/Downloads/Athena 2.13-2"
REDIRECTOR_EXTENSION_PATH = "extensions"

# Credentials
USERNAME = "p-agudurimdp"
PASSWORD = "Infer@2025"
PATIENT_ID = "4333"

class AthenaAutomation:
    def __init__(self):
        self.playwright = sync_playwright().start()
        self.browser = None
        self.page = None
        self.ai = None

    def setup(self):
        # Launch browser with extensions
        self.browser = self.playwright.chromium.launch_persistent_context(
            user_data_dir="./user-data",
            headless=False,
            args=[
                f"--disable-extensions-except={INFER_HCC_EXTENSION_PATH},{REDIRECTOR_EXTENSION_PATH}",
                f"--load-extension={INFER_HCC_EXTENSION_PATH},{REDIRECTOR_EXTENSION_PATH}"
            ],
        )
        time.sleep(3)  # Wait for extensions to load
        self.page = self.browser.new_page()
        
        # Initialize AI assistant with natural language processing capabilities
        self.ai = AIWrapper(self.page)

    def Athena_login(self):
        try:
            print("➡️ Logging into Athena...")
            self.page.goto(LOGIN_PAGE_URL)
            
            # Use AI to find and interact with login elements
            self.ai.fill_input("username input field", USERNAME)
            self.ai.fill_input("password input field", PASSWORD)
            self.ai.click("Log In button")
            
            # Handle department selection
            # print("➡️ Selecting department...")
            # self.ai.wait_for_text("Select Department")
            # self.ai.select_dropdown_option("department dropdown", "MAIN ST (HUB)")
            self.ai.click("GO button")
            
        except Exception as e:
            print(f"❌ Login failed: {e}")
            raise

    def search_patient(self):
        try:
            print("➡️ Searching for patient...")

            # Wait for and switch to the correct iframe ('GlobalNav')
            print("➡️ Switching to GlobalNav iframe...")
            self.page.wait_for_selector("iframe[id='GlobalNav']", timeout=60000)
            global_nav_frame = self.page.frame("GlobalNav")
            if not global_nav_frame:
                raise Exception("❌ Failed to switch to GlobalNav frame")

            print(f"➡️ Searching for patient ID: {PATIENT_ID}")

            # Wait for search input and clear it
            print("➡️ Waiting for search input...")
            search_input = global_nav_frame.wait_for_selector("#searchinput", timeout=10000)
            print("➡️ Clearing search input...")
            search_input.fill("")

            # Pause before typing
            self.page.wait_for_timeout(5000)

            # Enter patient ID
            print("➡️ Entering patient ID...")
            search_input.fill(PATIENT_ID)

            # Click the search button
            print("➡️ Clicking search button...")
            search_button = global_nav_frame.wait_for_selector(".searchicon.sprite-searchicon-13x13", timeout=5000)
            search_button.click()

            # ✅ **New: Verify Patient Chart is Loaded**
            print("➡️ Waiting for patient chart to load...")
            self.page.wait_for_timeout(5000)
            
            # Check if patient details or the "Visits" tab is available
            patient_loaded = self.page.wait_for_selector(
                ".chart-tabs.chart-component [data-chart-section-id='visits']", 
                timeout=20000
            )
            
            if not patient_loaded:
                raise Exception("❌ Patient chart did not load properly!")

            print("✅ Patient search completed successfully!")

        except Exception as e:
            print(f"❌ Failed to search patient: {e}")
            self.page.screenshot(path=f"patient_search_error_{int(time.time())}.png")
            raise

    def navigate_to_encounter(self):
        try:
            print("➡️ Navigating to patient encounter...")

            # ✅ **New: Wait for and switch to 'GlobalWrapper' iframe**
            print("➡️ Switching to GlobalWrapper iframe...")
            self.page.wait_for_selector("iframe[id='GlobalWrapper']", timeout=60000)
            global_wrapper_frame = self.page.frame("GlobalWrapper")
            if not global_wrapper_frame:
                raise Exception("❌ Failed to switch to GlobalWrapper frame")

            # ✅ **New: Wait for and switch to 'frameContent' iframe**
            print("➡️ Switching to frameContent iframe...")
            frame_content = global_wrapper_frame.frame("frameContent")
            if not frame_content:
                raise Exception("❌ Failed to switch to frameContent frame")

            # ✅ **New: Wait for and switch to 'frMain' iframe**
            print("➡️ Switching to frMain iframe...")
            fr_main = frame_content.frame("frMain")
            if not fr_main:
                raise Exception("❌ Failed to switch to frMain frame")

            # ✅ **New: Retry clicking the "Visits" tab up to 10 times**
            print("➡️ Clicking Visits tab...")

            counter = 0
            max_retries = 10
            visit_tab_clicked = False

            while counter < max_retries:
                try:
                    # Wait for and click the "Visits" tab
                    visits_tab = fr_main.wait_for_selector(
                        ".chart-tabs.chart-component [data-chart-section-id='visits']", timeout=5000
                    )
                    visits_tab.click()

                    # Verify that the "Visits" tab is active
                    active_visits_tab = fr_main.wait_for_selector(
                        ".metric-location .chart-tabs__list-item.active[data-chart-section-id='visits']", timeout=5000
                    )
                    if active_visits_tab:
                        visit_tab_clicked = True
                        break  # Exit loop if successful

                except Exception:
                    print(f"⚠️ Retry {counter + 1}/{max_retries} - Visits tab not found or not clickable yet")
                    self.page.wait_for_timeout(1000)
                    counter += 1

            if not visit_tab_clicked:
                raise Exception("❌ Failed to click Visits tab after multiple attempts")

            print("✅ Successfully navigated to the encounter")

        except Exception as e:
            print(f"❌ Navigation to encounter failed: {e}")
            self.page.screenshot(path=f"encounter_navigation_error_{int(time.time())}.png")
            raise


    def handle_hcc_codes(self):
        print("➡️ Managing HCC codes...")
        # Use AI to interact with HCC tab and codes
        self.ai.click("HCC tab or drawer")
        self.ai.wait_for_text("Suggested Codes")
        
        # Handle code selection and rejection
        self.ai.click("select button for suggested code")
        self.ai.click("reject button")
        
        # Verify rejection and banner message
        self.ai.wait_for_text("successfully flagged as rejected")
        
        # Remove rejection using AI
        self.ai.click("rejection indicator or ban symbol")
        self.ai.wait_for_text("Rejected by")
        self.ai.click("button to remove rejection")
        
        # Verify rejection removed
        self.ai.wait_for_element("select button is visible again")

    def logout(self):
        print("➡️ Logging out...")
        # Use AI to handle logout flow
        self.ai.click("logout button or menu")
        self.ai.click("confirm logout button")

    def click_hcc_assistant_tab(self):
        try:
            print("➡️ Opening HCC Assistant tab...")
            
            # Wait for and switch to GlobalWrapper iframe
            try:
                print("➡️ Switching to GlobalWrapper frame...")
                global_wrapper = self.ai.switch_to_frame("GlobalWrapper frame")
                global_wrapper.wait_for_load_state("domcontentloaded")
                
                # Wait for and switch to frameContent
                print("➡️ Switching to frameContent...")
                frame_content = self.ai.switch_to_nested_frame(global_wrapper, "frameContent frame")
                frame_content.wait_for_load_state("domcontentloaded")
                
                # Wait for and switch to frMain
                print("➡️ Switching to frMain frame...")
                fr_main = self.ai.switch_to_nested_frame(frame_content, "frMain frame")
                fr_main.wait_for_load_state("domcontentloaded")
                
                # Click the HCC Assistant tab
                print("➡️ Clicking HCC Assistant tab...")
                self.ai.click("HCC Assistant tab", frame=fr_main)
                
                print("✅ Successfully opened HCC Assistant")
                
            except Exception as e:
                print(f"❌ Failed to interact with frames: {e}")
                self.page.screenshot(path=f"frame_navigation_error_{int(time.time())}.png")
                raise
            
        except Exception as e:
            print(f"❌ Failed to open HCC Assistant: {e}")
            raise

    def run_test(self):
        try:
            self.setup()
            self.Athena_login()
            self.search_patient()
            self.navigate_to_encounter()
            
            # Wait for page to load after patient search
            print("➡️ Waiting for page load...")
            self.page.wait_for_timeout(30000)
            
            # Click HCC Assistant tab
            self.click_hcc_assistant_tab()
            # self.navigate_to_encounter()
            # self.handle_hcc_codes()
            # self.logout()

            
            print("✅ Test completed successfully!")
            
        except Exception as e:
            print(f"❌ Test failed: {e}")
            self.page.screenshot(path="error_screenshot.png")
            
        finally:
            if self.browser:
                self.browser.close()
            if self.playwright:
                self.playwright.stop()

if __name__ == "__main__":
    automation = AthenaAutomation()
    automation.run_test()