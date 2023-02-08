*** Settings ***
Documentation    Page elements verifications
Library          SeleniumLibrary
Resource         ../../resources/keywords.robot
Resource         ../../resources/variables.robot
Test Teardown    Close Browser

*** Test Cases ***
Verify sign-in page elements
    Open Sign-In Page
    Wait Until Element Is Visible    ${SINGIN_PAGE_TITLE}
    Wait Until Element Is Visible    ${SINGIN_EMAIL_LABEL}
    Wait Until Element Is Visible    ${SINGIN_EMAIL_INPUT}
    Wait Until Element Is Visible    ${SINGIN_EMAIL_SUBMIT}
    Wait Until Element Is Visible    ${SINGIN_LEGAL_TEXT}
    Click Element                    ${SINGIN_NEED_HELP}
    Wait Until Element Is Visible    ${SINGIN_FORGOT_PASSWORD_LINK}
    Wait Until Element Is Visible    ${SIGIN_CREATEACCOUNT_BUTTON}

Verify create-account page elements 
    Open Create-Account Page
    Wait Until Element Is Visible    ${CA_PAGE_TITLE}
    Wait Until Element Is Visible    ${CA_NAME_LABEL}
    Wait Until Element Is Visible    ${CA_NAME_INPUT}
    Wait Until Element Is Visible    ${CA_EMAIL_LABEL}
    Wait Until Element Is Visible    ${CA_EMAIL_INPUT}
    Wait Until Element Is Visible    ${CA_PASSWORD_LABEL}
    Wait Until Element Is Visible    ${CA_PASSWORD_INPUT}
    Wait Until Element Is Visible    ${CA_REPASSWORD_LABEL}
    Wait Until Element Is Visible    ${CA_REPASSWORD_INPUT}
    Wait Until Element Is Visible    ${CA_SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${CA_SINGIN_LINK}
    Wait Until Element Is Visible    ${CA_CABUSINESS_LINK}