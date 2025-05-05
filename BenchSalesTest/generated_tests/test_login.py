import pytest
from playwright.sync_api import Page, expect

def test_successful_login(page: Page, base_url: str):
    """
    Test the complete login flow:
    1. Navigate to login page
    2. Fill in credentials
    3. Click sign in
    4. Verify successful login and dashboard access
    """
    # Navigate to login page
    page.goto(f"{base_url}/login")
    
    # Verify we're on the login page
    expect(page).to_have_url(f"{base_url}/login")
    expect(page.get_by_role("heading", name="Sign in to your account")).to_be_visible()
    
    # Fill in the email
    email_input = page.get_by_label("Email")
    expect(email_input).to_be_visible()
    email_input.fill("kranthi@edvenswatech.com")
    expect(email_input).to_have_value("kranthi@edvenswatech.com")
    
    # Fill in the password
    password_input = page.get_by_placeholder("Enter your password")
    expect(password_input).to_be_visible()
    password_input.fill("Edvenswatech@2025")
    expect(password_input).to_have_value("Edvenswatech@2025")
    
    # Click the sign in button
    sign_in_button = page.locator("button[type='submit']")
    expect(sign_in_button).to_be_visible()
    expect(sign_in_button).to_be_enabled()
    sign_in_button.click()
    
    # Verify successful login and dashboard access
    expect(page).to_have_url(f"{base_url}/admin/dashboard", timeout=10000)
    
    # Verify dashboard heading
    dashboard_heading = page.get_by_role("heading", name="Dashboard")
    expect(dashboard_heading).to_be_visible()
    
    # Verify main navigation menu (using more specific selector)
    main_nav = page.locator("nav.p-4")
    expect(main_nav).to_be_visible()
    expect(main_nav.get_by_text("Dashboard")).to_be_visible()
    
    # Verify breadcrumb navigation
    breadcrumb = page.locator("nav.text-sm.text-gray-500")
    expect(breadcrumb).to_be_visible()
    expect(breadcrumb.get_by_text("Home / dashboard")).to_be_visible()

def test_invalid_login(page: Page, base_url: str):
    """
    Test login with invalid credentials:
    1. Navigate to login page
    2. Fill in invalid credentials
    3. Verify error message
    """
    # Navigate to login page
    page.goto(f"{base_url}/login")
    
    # Fill in invalid email
    email_input = page.get_by_label("Email")
    email_input.fill("invalid@example.com")
    
    # Fill in invalid password
    password_input = page.get_by_placeholder("Enter your password")
    password_input.fill("wrongpassword")
    
    # Click the sign in button
    sign_in_button = page.locator("button[type='submit']")
    sign_in_button.click()
    
    # Verify error message
    expect(page.get_by_text("Invalid credentials")).to_be_visible()
    expect(page).to_have_url(f"{base_url}/login") 