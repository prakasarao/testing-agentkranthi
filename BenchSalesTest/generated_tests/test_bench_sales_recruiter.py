import pytest
from playwright.sync_api import Page, expect
import random
import string
from typing import List, Dict

def generate_random_email():
    """Generate a random email for testing"""
    random_string = ''.join(random.choices(string.ascii_lowercase, k=8))
    return f"test_{random_string}@example.com"

def generate_random_name():
    """Generate a random name for testing"""
    first_names = ["John", "Jane", "Mike", "Sarah", "Alex"]
    last_names = ["Smith", "Doe", "Johnson", "Brown", "Wilson"]
    return f"{random.choice(first_names)} {random.choice(last_names)}"

class TestBenchSalesRecruiter:
    """Test class for Bench Sales Recruiter functionality"""
    
    @pytest.fixture(autouse=True)
    def setup(self, page: Page, base_url: str):
        """Setup fixture that runs before each test"""
        self.page = page
        self.base_url = base_url
        self.test_users = [
            {
                "name": "Test Adding User1",
                "email": "testaddinguser1@gmail.com",
                "password": "testadduser1",
                "role": "Bench Sales Manager",
                "status": "Active"
            },
            {
                "name": "Test Adding User2",
                "email": "testaddinguser2@gmail.com",
                "password": "testadduser2",
                "role": "Bench Sales Manager",
                "status": "Inactive"
            },
            {
                "name": "Test Adding User3",
                "email": "testaddinguser3@gmail.com",
                "password": "testadduser3",
                "role": "Bench Sales Recruiter",
                "status": "Active"
            },
            {
                "name": "Test Adding User4",
                "email": "testaddinguser4@gmail.com",
                "password": "testadduser4",
                "role": "Bench Sales Recruiter",
                "status": "Inactive"
            }
        ]
        
        # Login and navigate to Bench Sales Recruiter page
        self.login_and_navigate()
        
    def login_and_navigate(self):
        """Login and navigate to the Bench Sales Recruiter page"""
        # Navigate to login page
        self.page.goto(f"{self.base_url}/login")
        
        # Verify we're on the login page
        expect(self.page).to_have_url(f"{self.base_url}/login")
        expect(self.page.get_by_role("heading", name="Sign in to your account")).to_be_visible()
        
        # Fill in the email
        email_input = self.page.get_by_label("Email")
        expect(email_input).to_be_visible()
        email_input.fill("kranthi@edvenswatech.com")
        expect(email_input).to_have_value("kranthi@edvenswatech.com")
        
        # Fill in the password
        password_input = self.page.get_by_placeholder("Enter your password")
        expect(password_input).to_be_visible()
        password_input.fill("Edvenswatech@2025")
        expect(password_input).to_have_value("Edvenswatech@2025")
        
        # Click the sign in button and wait for navigation
        sign_in_button = self.page.locator("button[type='submit']")
        expect(sign_in_button).to_be_visible()
        expect(sign_in_button).to_be_enabled()
        
        with self.page.expect_navigation(wait_until="networkidle"):
            sign_in_button.click()
        
        # Verify successful login and dashboard access
        expect(self.page).to_have_url(f"{self.base_url}/admin/dashboard", timeout=10000)
        
        # Verify dashboard heading
        dashboard_heading = self.page.get_by_role("heading", name="Dashboard")
        expect(dashboard_heading).to_be_visible()
        
        # Wait for page load and click Users link
        self.page.wait_for_load_state("networkidle")
        self.page.wait_for_timeout(2000)  # Wait for any animations
        
        users_link = self.page.get_by_role("link", name="Users")
        expect(users_link).to_be_visible()
        expect(users_link).to_be_enabled()
        
        with self.page.expect_navigation(wait_until="networkidle"):
            users_link.click()
        
        # Verify we're on the users page
        expect(self.page).to_have_url(f"{self.base_url}/admin/users", timeout=10000)

    def add_user(self, user_data: Dict[str, str]):
        """Helper method to add a user"""
        # Click Add User button and wait for modal
        add_user_button = self.page.get_by_text("Add User", exact=True)
        expect(add_user_button).to_be_visible()
        add_user_button.click()
        
        # Wait for modal animation
        self.page.wait_for_timeout(2000)
        
        # Fill in user details with exact CSS selectors
        # Name field
        name_input = self.page.locator("body > div > div > main > div > div.fixed.inset-0.bg-black.bg-opacity-50.flex.items-center.justify-center.z-50 > div > form > div:nth-child(1) > input")
        expect(name_input).to_be_visible()
        expect(name_input).to_be_enabled()
        name_input.click()  # Ensure focus
        name_input.fill("")  # Clear first
        name_input.fill(user_data["name"])
        
        # Email field
        email_input = self.page.locator("body > div > div > main > div > div.fixed.inset-0.bg-black.bg-opacity-50.flex.items-center.justify-center.z-50 > div > form > div:nth-child(2) > input")
        expect(email_input).to_be_visible()
        expect(email_input).to_be_enabled()
        email_input.click()  # Ensure focus
        email_input.fill("")  # Clear first
        email_input.fill(user_data["email"])
        
        # Password field
        password_input = self.page.locator("body > div > div > main > div > div.fixed.inset-0.bg-black.bg-opacity-50.flex.items-center.justify-center.z-50 > div > form > div:nth-child(3) > input")
        expect(password_input).to_be_visible()
        expect(password_input).to_be_enabled()
        password_input.click()  # Ensure focus
        password_input.fill("")  # Clear first
        password_input.fill(user_data["password"])
        
        # Role dropdown - map role names to values
        role_select = self.page.locator("body > div > div > main > div > div.fixed.inset-0.bg-black.bg-opacity-50.flex.items-center.justify-center.z-50 > div > form > div:nth-child(4) > select")
        expect(role_select).to_be_visible()
        expect(role_select).to_be_enabled()
        role_value = "admin" if user_data["role"] == "Bench Sales Manager" else "recruiter"
        role_select.select_option(role_value)
        self.page.wait_for_timeout(500)  # Wait for dropdown to settle
        
        # Status dropdown - map status names to values
        status_select = self.page.locator("body > div > div > main > div > div.fixed.inset-0.bg-black.bg-opacity-50.flex.items-center.justify-center.z-50 > div > form > div:nth-child(5) > select")
        expect(status_select).to_be_visible()
        expect(status_select).to_be_enabled()
        status_value = "active" if user_data["status"] == "Active" else "inactive"
        status_select.select_option(status_value)
        self.page.wait_for_timeout(500)  # Wait for dropdown to settle
        
        # Verify all fields before submitting
        expect(name_input).to_have_value(user_data["name"])
        expect(email_input).to_have_value(user_data["email"])
        expect(password_input).to_have_value(user_data["password"])
        
        # Click Create button with exact selector
        create_button = self.page.locator("body > div > div > main > div > div.fixed.inset-0.bg-black.bg-opacity-50.flex.items-center.justify-center.z-50 > div > form > div.flex.justify-end.space-x-2 > button.px-4.py-2.bg-blue-500.text-white.rounded.hover\\:bg-blue-600.focus\\:outline-none.focus\\:ring-2.focus\\:ring-blue-500.focus\\:ring-offset-2")
        expect(create_button).to_be_visible()
        expect(create_button).to_be_enabled()
        
        # Submit form
        create_button.click()
        self.page.wait_for_timeout(2000)  # Wait for form submission
        
        # Wait for success message or error message
        try:
            success_message = self.page.get_by_text("User created successfully")
            expect(success_message).to_be_visible(timeout=10000)
        except:
            # Check for error message
            error_message = self.page.get_by_text("Error")
            if error_message.is_visible():
                error_text = error_message.text_content()
                raise Exception(f"Failed to create user: {error_text}")
            else:
                raise Exception("Failed to create user: No success or error message found")
        
        # Wait for modal to close
        self.page.wait_for_timeout(2000)
        
        # Wait for table to update and verify user in listing
        search_input = self.page.get_by_placeholder("Search")
        expect(search_input).to_be_visible()
        search_input.click()  # Ensure focus
        search_input.fill("")  # Clear first
        search_input.fill(user_data["name"])
        self.page.wait_for_timeout(1000)  # Wait for search results
        
        # Verify user in table
        user_row = self.page.locator("tbody tr").filter(has_text=user_data["name"])
        expect(user_row).to_be_visible(timeout=10000)
        expect(user_row.get_by_text(user_data["role"])).to_be_visible()
        expect(user_row.get_by_text(user_data["status"])).to_be_visible()

    def delete_user(self, user_data: Dict[str, str]):
        """Helper method to delete a user"""
        # Search for user
        search_input = self.page.get_by_placeholder("Search")
        search_input.fill(user_data["name"])

        # Click delete button
        user_row = self.page.locator("tr").filter(has_text=user_data["name"])
        expect(user_row).to_be_visible()
        delete_button = user_row.get_by_role("button", name="Delete")
        expect(delete_button).to_be_visible()
        delete_button.click()

        # Wait for confirmation dialog
        confirm_dialog = self.page.locator("div[role='alertdialog']")
        expect(confirm_dialog).to_be_visible()
        confirm_button = confirm_dialog.get_by_role("button", name="Confirm")
        expect(confirm_button).to_be_visible()
        confirm_button.click()

        # Wait for success message
        success_message = self.page.get_by_text("User deleted successfully")
        expect(success_message).to_be_visible()

        # Verify user is removed
        search_input.fill(user_data["name"])
        user_row = self.page.locator("tr").filter(has_text=user_data["name"])
        expect(user_row).not_to_be_visible()

    def test_1_add_multiple_users(self):
        """Test adding multiple users with different role and status combinations"""
        for user_data in self.test_users:
            self.add_user(user_data)
            
    def test_2_verify_and_delete_users(self):
        """Test verifying and deleting all created users"""
        for user_data in self.test_users:
            # Verify user exists
            search_input = self.page.get_by_placeholder("Search")
            search_input.fill(user_data["name"])
            user_row = self.page.locator("tr").filter(has_text=user_data["name"])
            expect(user_row).to_be_visible()
            expect(user_row.get_by_text(user_data["role"])).to_be_visible()
            expect(user_row.get_by_text(user_data["status"])).to_be_visible()
            
            # Delete user
            self.delete_user(user_data) 