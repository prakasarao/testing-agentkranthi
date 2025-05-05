Feature: Web Application Test Suite
  As a user
  I want to interact with the web application
  So that I can perform various actions

  Scenario: Login Test
    Given I am on the page "https://qhire.edvenswatech.com/login"
    When I enter "kranthi@edvenswatech.com" into "input[name='email']"
    Then the input should be filled
    When I enter "Edvenswatech@2025" into "input[name='password']"
    Then the input should be filled
    When I click on the element "button[type='submit']"
    Then the element should be clicked
    Then I should be redirected to "https://qhire.edvenswatech.com/admin/dashboard"

  Scenario: Test button interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<button class="p-2 rounded-lg hover:bg-gray-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-menu w-6 h-6"><line x1="4" x2="20" y1="12" y2="12"></line><line x1="4" x2="20" y1="6" y2="6"></line><line x1="4" x2="20" y1="18" y2="18"></line></svg></button>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="p-2 rounded-lg hover:bg-gray-100" href="/"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house w-5 h-5"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path><path d="M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 bg-blue-50 text-blue-600" href="/admin/dashboard"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layout-dashboard w-5 h-5"><rect width="7" height="9" x="3" y="3" rx="1"></rect><rect width="7" height="5" x="14" y="3" rx="1"></rect><rect width="7" height="9" x="14" y="12" rx="1"></rect><rect width="7" height="5" x="3" y="16" rx="1"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/users"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users w-5 h-5"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/candidates"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-search w-5 h-5"><circle cx="10" cy="8" r="5"></circle><path d="M2 21a8 8 0 0 1 10.434-7.62"></path><circle cx="18" cy="18" r="3"></circle><path d="m22 22-1.9-1.9"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/jobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase w-5 h-5"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/profile"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user w-5 h-5"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="10" r="3"></circle><path d="M7 20.662V19a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v1.662"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/reviews"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5"><path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/savedjobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-bookmark w-5 h-5"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/dashboard" class="hover:underline">Home</a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase h-6 w-6 text-blue-500"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg><div><p class="text-sm font-medium text-gray-500">Total Jobs</p><h3 class="text-2xl font-bold">175</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2 h-6 w-6 text-green-500"><path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"></path><path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"></path><path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"></path><path d="M10 6h4"></path><path d="M10 10h4"></path><path d="M10 14h4"></path><path d="M10 18h4"></path></svg><div><p class="text-sm font-medium text-gray-500">Companies</p><h3 class="text-2xl font-bold">95</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-6 w-6 text-yellow-500"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg><div><p class="text-sm font-medium text-gray-500">Locations</p><h3 class="text-2xl font-bold">108</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction on dashboard
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe h-6 w-6 text-purple-500"><circle cx="12" cy="12" r="10"></circle><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"></path><path d="M2 12h20"></path></svg><div><p class="text-sm font-medium text-gray-500">Job Sources</p><h3 class="text-2xl font-bold">2</h3></div></div></a>"
    Then the element should be clicked


# New Test Cases Generated at 2025-03-04 17:48:35

# Login Page Test Cases
Feature: Login Page Test Suite
  As a user
  I want to interact with the login page
  So that I can perform various actions


  Scenario: Login Test
    Given I am on the page "https://qhire.edvenswatech.com/login"
    When I enter "kranthi@edvenswatech.com" into "input[name='email']"
    Then the input should be filled
    When I enter "Edvenswatech@2025" into "input[name='password']"
    Then the input should be filled
    When I click on the element "button[type='submit']"
    Then the element should be clicked
    Then I should be redirected to "https://qhire.edvenswatech.com/admin/dashboard"


# Dashboard Page Test Cases
Feature: Dashboard Page Test Suite
  As a user
  I want to interact with the dashboard page
  So that I can perform various actions


  Scenario: Test button interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<button class="p-2 rounded-lg hover:bg-gray-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-menu w-6 h-6"><line x1="4" x2="20" y1="12" y2="12"></line><line x1="4" x2="20" y1="6" y2="6"></line><line x1="4" x2="20" y1="18" y2="18"></line></svg></button>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="p-2 rounded-lg hover:bg-gray-100" href="/"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house w-5 h-5"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path><path d="M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 bg-blue-50 text-blue-600" href="/admin/dashboard"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layout-dashboard w-5 h-5"><rect width="7" height="9" x="3" y="3" rx="1"></rect><rect width="7" height="5" x="14" y="3" rx="1"></rect><rect width="7" height="9" x="14" y="12" rx="1"></rect><rect width="7" height="5" x="3" y="16" rx="1"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/users"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users w-5 h-5"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/candidates"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-search w-5 h-5"><circle cx="10" cy="8" r="5"></circle><path d="M2 21a8 8 0 0 1 10.434-7.62"></path><circle cx="18" cy="18" r="3"></circle><path d="m22 22-1.9-1.9"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/jobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase w-5 h-5"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/profile"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user w-5 h-5"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="10" r="3"></circle><path d="M7 20.662V19a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v1.662"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/reviews"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5"><path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/savedjobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-bookmark w-5 h-5"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/dashboard" class="hover:underline">Home</a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase h-6 w-6 text-blue-500"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg><div><p class="text-sm font-medium text-gray-500">Total Jobs</p><h3 class="text-2xl font-bold">175</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2 h-6 w-6 text-green-500"><path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"></path><path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"></path><path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"></path><path d="M10 6h4"></path><path d="M10 10h4"></path><path d="M10 14h4"></path><path d="M10 18h4"></path></svg><div><p class="text-sm font-medium text-gray-500">Companies</p><h3 class="text-2xl font-bold">95</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-6 w-6 text-yellow-500"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg><div><p class="text-sm font-medium text-gray-500">Locations</p><h3 class="text-2xl font-bold">108</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe h-6 w-6 text-purple-500"><circle cx="12" cy="12" r="10"></circle><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"></path><path d="M2 12h20"></path></svg><div><p class="text-sm font-medium text-gray-500">Job Sources</p><h3 class="text-2xl font-bold">2</h3></div></div></a>"
    Then the element should be clicked


# New Test Cases Generated at 2025-03-04 17:55:20

# Login Page Test Cases
Feature: Login Page Test Suite
  As a user
  I want to interact with the login page
  So that I can perform various actions


  Scenario: Login Test
    Given I am on the page "https://qhire.edvenswatech.com/login"
    When I enter "kranthi@edvenswatech.com" into "input[name='email']"
    Then the input should be filled
    When I enter "Edvenswatech@2025" into "input[name='password']"
    Then the input should be filled
    When I click on the element "button[type='submit']"
    Then the element should be clicked
    Then I should be redirected to "https://qhire.edvenswatech.com/admin/dashboard"


# Dashboard Page Test Cases
Feature: Dashboard Page Test Suite
  As a user
  I want to interact with the dashboard page
  So that I can perform various actions


  Scenario: Test button interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<button class="p-2 rounded-lg hover:bg-gray-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-menu w-6 h-6"><line x1="4" x2="20" y1="12" y2="12"></line><line x1="4" x2="20" y1="6" y2="6"></line><line x1="4" x2="20" y1="18" y2="18"></line></svg></button>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="p-2 rounded-lg hover:bg-gray-100" href="/"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house w-5 h-5"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path><path d="M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 bg-blue-50 text-blue-600" href="/admin/dashboard"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layout-dashboard w-5 h-5"><rect width="7" height="9" x="3" y="3" rx="1"></rect><rect width="7" height="5" x="14" y="3" rx="1"></rect><rect width="7" height="9" x="14" y="12" rx="1"></rect><rect width="7" height="5" x="3" y="16" rx="1"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/users"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users w-5 h-5"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/candidates"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-search w-5 h-5"><circle cx="10" cy="8" r="5"></circle><path d="M2 21a8 8 0 0 1 10.434-7.62"></path><circle cx="18" cy="18" r="3"></circle><path d="m22 22-1.9-1.9"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/jobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase w-5 h-5"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/profile"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user w-5 h-5"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="10" r="3"></circle><path d="M7 20.662V19a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v1.662"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/reviews"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star w-5 h-5"><path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/savedjobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-bookmark w-5 h-5"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/dashboard" class="hover:underline">Home</a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase h-6 w-6 text-blue-500"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg><div><p class="text-sm font-medium text-gray-500">Total Jobs</p><h3 class="text-2xl font-bold">175</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2 h-6 w-6 text-green-500"><path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"></path><path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"></path><path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"></path><path d="M10 6h4"></path><path d="M10 10h4"></path><path d="M10 14h4"></path><path d="M10 18h4"></path></svg><div><p class="text-sm font-medium text-gray-500">Companies</p><h3 class="text-2xl font-bold">95</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-6 w-6 text-yellow-500"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg><div><p class="text-sm font-medium text-gray-500">Locations</p><h3 class="text-2xl font-bold">108</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe h-6 w-6 text-purple-500"><circle cx="12" cy="12" r="10"></circle><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"></path><path d="M2 12h20"></path></svg><div><p class="text-sm font-medium text-gray-500">Job Sources</p><h3 class="text-2xl font-bold">2</h3></div></div></a>"
    Then the element should be clicked


# New Test Cases Generated at 2025-03-13 15:43:20

# Login Page Test Cases
Feature: Login Page Test Suite
  As a user
  I want to interact with the login page
  So that I can perform various actions


  Scenario: Login Test
    Given I am on the page "https://qhire.edvenswatech.com/login"
    When I enter "superuser@edvenswatech.com" into "input[name='email']"
    Then the input should be filled
    When I enter "admin123" into "input[name='password']"
    Then the input should be filled
    When I click on the element "button[type='submit']"
    Then the element should be clicked
    Then I should be redirected to "https://qhire.edvenswatech.com/admin/dashboard"


# Dashboard Page Test Cases
Feature: Dashboard Page Test Suite
  As a user
  I want to interact with the dashboard page
  So that I can perform various actions


  Scenario: Test button interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<button class="p-2 rounded-lg hover:bg-gray-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-menu w-6 h-6"><line x1="4" x2="20" y1="12" y2="12"></line><line x1="4" x2="20" y1="6" y2="6"></line><line x1="4" x2="20" y1="18" y2="18"></line></svg></button>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="p-2 rounded-lg hover:bg-gray-100" href="/"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house w-5 h-5"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path><path d="M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 bg-blue-50 text-blue-600" href="/admin/dashboard"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layout-dashboard w-5 h-5"><rect width="7" height="9" x="3" y="3" rx="1"></rect><rect width="7" height="5" x="14" y="3" rx="1"></rect><rect width="7" height="9" x="14" y="12" rx="1"></rect><rect width="7" height="5" x="3" y="16" rx="1"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/users"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users w-5 h-5"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/candidates"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-search w-5 h-5"><circle cx="10" cy="8" r="5"></circle><path d="M2 21a8 8 0 0 1 10.434-7.62"></path><circle cx="18" cy="18" r="3"></circle><path d="m22 22-1.9-1.9"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/jobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase w-5 h-5"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/profile"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user w-5 h-5"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="10" r="3"></circle><path d="M7 20.662V19a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v1.662"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/savedjobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-bookmark w-5 h-5"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="hover:underline" href="/">Home</a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase h-6 w-6 text-blue-500"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg><div><p class="text-sm font-medium text-gray-500">Total Jobs</p><h3 class="text-2xl font-bold">724</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2 h-6 w-6 text-green-500"><path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"></path><path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"></path><path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"></path><path d="M10 6h4"></path><path d="M10 10h4"></path><path d="M10 14h4"></path><path d="M10 18h4"></path></svg><div><p class="text-sm font-medium text-gray-500">Companies</p><h3 class="text-2xl font-bold">209</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-6 w-6 text-yellow-500"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg><div><p class="text-sm font-medium text-gray-500">Locations</p><h3 class="text-2xl font-bold">181</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe h-6 w-6 text-purple-500"><circle cx="12" cy="12" r="10"></circle><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"></path><path d="M2 12h20"></path></svg><div><p class="text-sm font-medium text-gray-500">Job Sources</p><h3 class="text-2xl font-bold">3</h3></div></div></a>"
    Then the element should be clicked


# New Test Cases Generated at 2025-03-18 14:56:08

# Login Page Test Cases
Feature: Login Page Test Suite
  As a user
  I want to interact with the login page
  So that I can perform various actions


  Scenario: Login Test
    Given I am on the page "https://qhire.edvenswatech.com/login"
    When I enter "superuser@edvenswatech.com" into "input[name='email']"
    Then the input should be filled
    When I enter "admin123" into "input[name='password']"
    Then the input should be filled
    When I click on the element "button[type='submit']"
    Then the element should be clicked
    Then I should be redirected to "https://qhire.edvenswatech.com/admin/dashboard"


# Dashboard Page Test Cases
Feature: Dashboard Page Test Suite
  As a user
  I want to interact with the dashboard page
  So that I can perform various actions


  Scenario: Test button interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<button class="p-2 rounded-lg hover:bg-gray-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-menu w-6 h-6"><line x1="4" x2="20" y1="12" y2="12"></line><line x1="4" x2="20" y1="6" y2="6"></line><line x1="4" x2="20" y1="18" y2="18"></line></svg></button>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="p-2 rounded-lg hover:bg-gray-100" href="/"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-house w-5 h-5"><path d="M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8"></path><path d="M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 bg-blue-50 text-blue-600" href="/admin/dashboard"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layout-dashboard w-5 h-5"><rect width="7" height="9" x="3" y="3" rx="1"></rect><rect width="7" height="5" x="14" y="3" rx="1"></rect><rect width="7" height="9" x="14" y="12" rx="1"></rect><rect width="7" height="5" x="3" y="16" rx="1"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/users"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users w-5 h-5"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/candidates"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-search w-5 h-5"><circle cx="10" cy="8" r="5"></circle><path d="M2 21a8 8 0 0 1 10.434-7.62"></path><circle cx="18" cy="18" r="3"></circle><path d="m22 22-1.9-1.9"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/jobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase w-5 h-5"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/profile"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user w-5 h-5"><circle cx="12" cy="12" r="10"></circle><circle cx="12" cy="10" r="3"></circle><path d="M7 20.662V19a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v1.662"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="flex items-center gap-3 p-2 rounded-lg hover:bg-gray-100 " href="/admin/savedjobs"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-bookmark w-5 h-5"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a class="hover:underline" href="/">Home</a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-briefcase h-6 w-6 text-blue-500"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path><rect width="20" height="14" x="2" y="6" rx="2"></rect></svg><div><p class="text-sm font-medium text-gray-500">Total Jobs</p><h3 class="text-2xl font-bold">724</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2 h-6 w-6 text-green-500"><path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"></path><path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"></path><path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"></path><path d="M10 6h4"></path><path d="M10 10h4"></path><path d="M10 14h4"></path><path d="M10 18h4"></path></svg><div><p class="text-sm font-medium text-gray-500">Companies</p><h3 class="text-2xl font-bold">209</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-6 w-6 text-yellow-500"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg><div><p class="text-sm font-medium text-gray-500">Locations</p><h3 class="text-2xl font-bold">181</h3></div></div></a>"
    Then the element should be clicked

  Scenario: Test a interaction
    Given I am on the page "https://qhire.edvenswatech.com/admin/dashboard"
    When I click on the element "<a href="/admin/jobs"><div class="flex items-center space-x-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe h-6 w-6 text-purple-500"><circle cx="12" cy="12" r="10"></circle><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"></path><path d="M2 12h20"></path></svg><div><p class="text-sm font-medium text-gray-500">Job Sources</p><h3 class="text-2xl font-bold">3</h3></div></div></a>"
    Then the element should be clicked

