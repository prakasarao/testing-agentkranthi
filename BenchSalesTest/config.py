# config.py

# Configuration for the test framework
class Config:
    BASE_URL = "https://qhire.edvenswatech.com"
    LOGIN_URL = f"{BASE_URL}/login"
    DASHBOARD_URL = f"{BASE_URL}/admin/dashboard"  # Add the dashboard URL here
    CREDENTIALS = {
        "username": "superuser@edvenswatech.com",  # Update with your username
        "password": "admin123"                 # Update with your password
    }