# Robotframework Portfolio

## How to install

1. Clone or download the repository
2. Install the python in your machine
3. Install the requirements/dependencies of robot related package
   > install -r requirements.txt
4. Go to the directory and run all the test
   > robot .

# Test Scopes

## Amazon

### [1. Redirection](https://github.com/amir-ubay-qa/robotframework/blob/main/testcases/amazon/01-redirection)

1. Open homepage
2. Open sing-in page
3. Open create-account page
4. Open create-business-account page
5. Open "condition of use" page from sign in page
6. Open "condition of use" page from create account page
7. Open "privacy notice" page from sign in page
8. Open "privacy notice" page from create account page
9. Open cart page (signed out user)
10. Open "today's deals" page from homepage
11. Open "customer services" page from homepage
12. Open "registry" page from homepage
13. Open "sell" page from homepage

### [2. Elements Verification](https://github.com/amir-ubay-qa/robotframework/blob/main/testcases/amazon/02-elements-verifications)

1. Verify sign-in page elements
2. Verify create-account page elements

### [3. User Journeys](https://github.com/amir-ubay-qa/robotframework/blob/main/testcases/amazon/03-user-journeys)

1. Simulate create account (Until puzzle verification)
2. Simulate sign-in with invalid email

