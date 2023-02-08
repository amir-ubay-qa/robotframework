*** Settings ***
Documentation    Page elements verifications
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${HOME_SIGNIN_BUTTON}                id:nav-link-accountList-nav-line-1
${SIGIN_CREATEACCOUNT_BUTTON}        id:createAccountSubmit
${CONDITION_OF_USE}                  //a[contains(text(),"Conditions of Use")]
${PRIVACY_NOTICE}                    //a[contains(text(),"Privacy Notice")]
${CREATE_BUSINESS_ACCOUNT}           id:ab-registration-link
${DONT_CHANGE_ADDRESS}               //input[@data-action-type="DISMISS"]
# Sing-in Page Elements
${SINGIN_PAGE_TITLE}                 //h1[contains(text(),"Sign in")]
${SINGIN_EMAIL_LABEL}                //label[@for="ap_email"][contains(text(),'Email or mobile phone number')]
${SINGIN_EMAIL_INPUT}                id:ap_email
${SINGIN_EMAIL_SUBMIT}               id:continue
${SINGIN_LEGAL_TEXT}                 id:legalTextRow
${SINGIN_NEED_HELP}                  //span[contains(text(),'Need help?')]
${SINGIN_FORGOT_PASSWORD_LINK}       id:auth-fpp-link-bottom
${SINGIN_CREATE_ACCOUNT_LINK}        id:createAccountSubmit
# Create-account Page Elements
${CA_PAGE_TITLE}                     //h1[contains(text(),"Create account")]
${CA_NAME_LABEL}                     //label[@for="ap_customer_name"]
${CA_NAME_INPUT}                     id:ap_customer_name
${CA_EMAIL_LABEL}                    //label[@for="ap_email"]
${CA_EMAIL_INPUT}                    id:ap_email
${CA_PASSWORD_LABEL}                 //label[@for="ap_password"]
${CA_PASSWORD_INPUT}                 id:ap_password
${CA_REPASSWORD_LABEL}               //label[@for="ap_password_check"]
${CA_REPASSWORD_INPUT}               id:ap_password_check
${CA_SUBMIT_BUTTON}                  id:continue
${CA_SINGIN_LINK}                    //a[contains(text(),"Sign in")]
${CA_CABUSINESS_LINK}                //a[contains(text(),"Create a free business account")]

*** Keywords ***
Open Home Page
    Open Browser                    https://www.amazon.com    browser=headlesschrome
    Wait Until Location Contains    www.amazon.com
    TRY
        Wait Until Element Is Visible       ${DONT_CHANGE_ADDRESS}    timeout=10 s
        Click Element                       ${DONT_CHANGE_ADDRESS}
        Wait Until Element Is Not Visible   ${DONT_CHANGE_ADDRESS}
    EXCEPT
        Log To Console    Change address popup doesn't appear
    END

Open Sign-In Page
    Open Home Page
    Click Element                   ${HOME_SIGNIN_BUTTON}
    Wait Until Location Contains    signin

Open Create-Account Page
    Open Sign-In Page
    Click Element                   ${SIGIN_CREATEACCOUNT_BUTTON}
    Wait Until Location Contains    register

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