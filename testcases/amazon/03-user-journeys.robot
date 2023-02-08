*** Settings ***
Documentation    Page elements verifications
Library          SeleniumLibrary
Resource         ../../resources/keywords.robot
Resource         ../../resources/variables.robot
Test Teardown    Close Browser

*** Test Cases ***
Simulate create new account (until puzzle verification page)
    [Tags]        positive-scenario
    Open Create-Account Page
    Wait Until Location Contains           /register
    Input Text            ${CA_NAME_INPUT}         John Doe
    Input Text            ${CA_EMAIL_INPUT}        johndoe@testmail.com
    Input Text            ${CA_PASSWORD_INPUT}     Qwerty911
    Input Text            ${CA_REPASSWORD_INPUT}   Qwerty911
    Click Element         ${CA_SUBMIT_BUTTON}
    Wait Until Location Contains    /ap/cvf/request
    Title Should Be        Authentication required

Simulate sign-in with invalid Email
    [Tags]        negative-scenario
    Open Sign-In Page
    Wait Until Page Contains    Sign in    timeout=10s
    Input Text    ${SINGIN_EMAIL_INPUT}    nouserx@randommail.com
    Click Element    ${SINGIN_EMAIL_SUBMIT}
    Wait Until Element Is Visible    id:auth-error-message-box
    Wait Until Element Is Visible    //div[@id="auth-error-message-box"]//h4[contains(text(),"There was a problem")]
    Wait Until Element Is Visible    //div[@id="auth-error-message-box"]//span[contains(text(),"We cannot find an account with that email address")]