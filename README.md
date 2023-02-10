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

## Reqres.in

### [1. User Endpoint Verification](https://github.com/amir-ubay-qa/robotframework/blob/main/testcases/reqres/01-user-endpoint)

1. Verify get list users page 1 respones key
2. Verify get list users page 1 response value
3. Verify list user data in page 1
4. Verify list user data in page 2
5. Verify single user data with id 2
6. Verify response of single user not found
7. Verify response of create a new user
8. Verify response of update a user
9. Verify response of delete a user


### [2. Authentication](https://github.com/amir-ubay-qa/robotframework/blob/main/testcases/reqres/02-user-authentication)

1. Verify response when register succesfully
2. Verify response register failed
3. Verify response login succesfully
4. Verify response login failed
