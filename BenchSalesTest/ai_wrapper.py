from playwright.sync_api import Page
import logging

logger = logging.getLogger(__name__)

class AIWrapper:
    def __init__(self, page: Page):
        self.page = page

    def fill_input(self, description: str, value: str, frame=None):
        """Fill input field based on natural language description"""
        logger.info(f"Filling input '{description}' with value '{value}'")
        
        # Map natural language descriptions to selectors
        selector_map = {
            "username input field": "input#athena-username",
            "password input field": "input#athena-password",
            "search input box": "#searchinput",
            "patient search box": "#searchinput",
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
            
        # Use the frame context if provided, otherwise use page
        context = frame if frame else self.page
        context.fill(selector, value)

    def click(self, description: str, frame=None):
        """Click element based on natural language description"""
        logger.info(f"Clicking element: {description}")
        
        # Map natural language descriptions to selectors
        selector_map = {
            "Log In button": "//span[text()='Log In']",
            "GO button": "#loginbutton",
            "search icon or button": ".searchicon.sprite-searchicon-13x13",
            "search button": ".searchicon.sprite-searchicon-13x13",  # Added alias
            "patient search box": "#searchinput",
            "Visits tab in patient chart": ".chart-tabs.chart-component [data-chart-section-id='visits']",
            "encounter dropdown arrow": ".encounter-arrow",
            "Finish Encounter button": "#finishEncounter",
            "dropdown to select exam": ".button-set-wrapper div [data-toggle='dropdown']",
            "Go to Exam option": "[data-stage='exam']",
            "HCC tab or drawer": "div[name='exam'] .autostart.pulltab-container .bg-green-extension.drawer-tab > .overlay-tab-label",
            "select button for suggested code": ".select-button",
            "reject button": "#rejectButton",
            "rejection indicator or ban symbol": ".ban-symbol",
            "button to remove rejection": "#removeRejection",
            "logout button or menu": "#logoutButton",
            "confirm logout button": "#confirmLogout",
            "HCC Assistant tab": "div[name='exam'] .autostart.pulltab-container .bg-green-extension.drawer-tab > .overlay-tab-label",
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
            
        # Use the frame context if provided, otherwise use page
        context = frame if frame else self.page
        context.click(selector)

    def wait_for_frame(self, frame_name: str):
        """Wait for and return a frame based on description"""
        logger.info(f"Waiting for frame: {frame_name}")
        return self.page.wait_for_selector(f"iframe#{frame_name}")

    def wait_for_text(self, text: str):
        """Wait for text to appear on page"""
        logger.info(f"Waiting for text: {text}")
        self.page.wait_for_selector(f"text={text}")

    def wait_for_element(self, description: str):
        """Wait for element based on description"""
        logger.info(f"Waiting for element: {description}")
        
        selector_map = {
            "select button is visible again": ".select-button"
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
            
        self.page.wait_for_selector(selector)

    def select_dropdown_option(self, description: str, value: str):
        """Select option from dropdown based on description"""
        logger.info(f"Selecting '{value}' from dropdown '{description}'")
        
        selector_map = {
            "department dropdown": "select#departmentid",
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
            
        self.page.select_option(selector, label=value)

    def switch_to_frame(self, frame_description):
        try:
            # Wait for iframe to be present
            iframe = self.page.wait_for_selector("iframe#GlobalNav", timeout=15000)
            if not iframe:
                raise Exception(f"Frame {frame_description} not found")
            
            # Get frame content
            frame = iframe.content_frame()
            if not frame:
                raise Exception(f"Unable to switch to frame {frame_description}")
            
            # Wait for frame to load
            frame.wait_for_load_state("domcontentloaded")
            return frame
            
        except Exception as e:
            logger.error(f"Failed to switch to frame {frame_description}: {e}")
            raise

    def fill_input(self, input_description, value):
        try:
            # Determine selector based on input description
            selector = None
            if "username" in input_description.lower():
                selector = "input#athena-username"
            elif "password" in input_description.lower():
                selector = "input#athena-password"
            elif "patient search" in input_description.lower():
                selector = ".navsearchinput"
            else:
                raise Exception(f"Unknown input description: {input_description}")

            # Wait for element and verify it exists
            element = self.page.wait_for_selector(selector, timeout=15000)
            if not element:
                raise Exception(f"Input element {input_description} not found")

            # Clear existing value and fill new value
            element.fill(value)
            self.page.wait_for_timeout(1000)  # Wait for input to settle

            # Verify value was set correctly
            actual_value = element.input_value()
            if actual_value != value:
                logger.warning(f"Input verification failed. Expected: {value}, Got: {actual_value}")
                element.fill(value)  # Retry filling the input
                self.page.wait_for_timeout(1000)

            return element

        except Exception as e:
            logger.error(f"Failed to fill input {input_description}: {e}")
            raise

    def click(self, description: str, frame=None):
        """Click element based on natural language description"""
        logger.info(f"Clicking element: {description}")
        
        # Map natural language descriptions to selectors
        selector_map = {
            "Log In button": "//span[text()='Log In']",
            "GO button": "#loginbutton",
            "search icon or button": ".searchicon.sprite-searchicon-13x13",
            "search button": ".searchicon.sprite-searchicon-13x13",  # Added alias
            "patient search box": "#searchinput",
            "Visits tab in patient chart": ".chart-tabs.chart-component [data-chart-section-id='visits']",
            "encounter dropdown arrow": ".encounter-arrow",
            "Finish Encounter button": "#finishEncounter",
            "dropdown to select exam": ".button-set-wrapper div [data-toggle='dropdown']",
            "Go to Exam option": "[data-stage='exam']",
            "HCC tab or drawer": "div[name='exam'] .autostart.pulltab-container .bg-green-extension.drawer-tab > .overlay-tab-label",
            "select button for suggested code": ".select-button",
            "reject button": "#rejectButton",
            "rejection indicator or ban symbol": ".ban-symbol",
            "button to remove rejection": "#removeRejection",
            "logout button or menu": "#logoutButton",
            "confirm logout button": "#confirmLogout",
            "HCC Assistant tab": "div[name='exam'] .autostart.pulltab-container .bg-green-extension.drawer-tab > .overlay-tab-label",
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
            
        # Use the frame context if provided, otherwise use page
        context = frame if frame else self.page
        context.click(selector)

    def wait_for_frame(self, frame_name: str):
        """Wait for and return a frame based on description"""
        logger.info(f"Waiting for frame: {frame_name}")
        return self.page.wait_for_selector(f"iframe#{frame_name}")

    def wait_for_text(self, text: str):
        """Wait for text to appear on page"""
        logger.info(f"Waiting for text: {text}")
        self.page.wait_for_selector(f"text={text}")

    def wait_for_element(self, description: str):
        """Wait for element based on description"""
        logger.info(f"Waiting for element: {description}")
        
        selector_map = {
            "select button is visible again": ".select-button"
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
            
        self.page.wait_for_selector(selector)

    def select_dropdown_option(self, description: str, value: str):
        """Select option from dropdown based on description"""
        logger.info(f"Selecting '{value}' from dropdown '{description}'")
        
        selector_map = {
            "department dropdown": "select#departmentid",
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
            
        self.page.select_option(selector, label=value)

    def switch_to_frame(self, frame_description: str):
        """Switch to iframe context"""
        logger.info(f"Switching to frame: {frame_description}")
        
        frame_map = {
            "main navigation frame": "#GlobalNav",
            "patient chart": "#Frame"
        }
        
        frame_selector = frame_map.get(frame_description)
        if not frame_selector:
            raise ValueError(f"No frame mapping found for: {frame_description}")
            
        frame_element = self.page.wait_for_selector(frame_selector)
        return frame_element.content_frame()

    def fill_input_and_press_enter(self, description: str, value: str, frame=None):
        """Fill input field and press Enter"""
        logger.info(f"Filling input '{description}' with value '{value}' and pressing Enter")
        
        # Map natural language descriptions to selectors
        selector_map = {
            "username input field": "input#athena-username",
            "password input field": "input#athena-password",
            "search input box": "#searchinput",
            "patient search box": "#searchinput",
        }
        
        selector = selector_map.get(description)
        if not selector:
            raise ValueError(f"No selector mapping found for: {description}")
        
        # Use the frame context if provided, otherwise use page
        context = frame if frame else self.page
        
        # Fill the input
        context.fill(selector, value)
        
        # Press Enter
        context.press(selector, "Enter")

    def switch_to_nested_frame(self, parent_frame, frame_description: str):
        """Switch to a nested iframe from a parent frame"""
        logger.info(f"Switching to nested frame: {frame_description}")
        
        frame_map = {
            "GlobalWrapper frame": "iframe#GlobalWrapper",
            "frameContent frame": "#frameContent",
            "frMain frame": "#frMain"
        }
        
        selector = frame_map.get(frame_description)
        if not selector:
            raise ValueError(f"No frame mapping found for: {frame_description}")
        
        # Wait for frame in parent context and switch to it
        frame_element = parent_frame.wait_for_selector(selector, timeout=30000)
        return frame_element.content_frame()