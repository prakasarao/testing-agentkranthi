import pytest
from playwright.sync_api import Page, expect, Browser, BrowserContext
from pathlib import Path
from datetime import datetime
import os

# Create screenshots directory if it doesn't exist
SCREENSHOT_DIR = Path("test-results/screenshots")
SCREENSHOT_DIR.mkdir(parents=True, exist_ok=True)

@pytest.fixture(scope="session")
def browser_context_args(browser_context_args):
    """Configure browser context"""
    return {
        **browser_context_args,
        "viewport": {"width": 1280, "height": 720},
        "record_video_dir": "test-results/videos"
    }

@pytest.fixture(scope="session")
def browser():
    """Create a shared browser instance for all tests"""
    from playwright.sync_api import sync_playwright
    playwright = sync_playwright().start()
    browser = playwright.chromium.launch(headless=False)
    yield browser
    browser.close()
    playwright.stop()

@pytest.fixture(scope="session")
def context(browser: Browser):
    """Create a shared browser context for all tests"""
    context = browser.new_context()
    yield context
    context.close()

@pytest.fixture
def page(context: BrowserContext, base_url: str, request):
    """Create a new page for each test using the shared context"""
    page = context.new_page()
    page.goto(base_url)
    yield page
    
    # Take screenshot if test failed
    try:
        if hasattr(request.node, 'rep_call') and request.node.rep_call.failed:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            screenshot_name = f"{request.node.name}_{timestamp}.png"
            page.screenshot(path=f"test-results/screenshots/{screenshot_name}")
    except Exception as e:
        print(f"Failed to take screenshot: {str(e)}")
    
    # Close only the page, not the context
    page.close()

@pytest.fixture(autouse=True)
def setup(base_url):
    """Setup global variables"""
    global BASE_URL
    BASE_URL = base_url 

@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_makereport(item, call):
    """Hook to store test results for screenshot capture"""
    outcome = yield
    rep = outcome.get_result()
    
    # Set report attributes on test item for each phase
    setattr(item, f"rep_{rep.when}", rep) 