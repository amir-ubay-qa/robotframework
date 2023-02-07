*** Settings ***
Documentation    Redirection links test suite 
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${HOME_SIGNIN_BUTTON}                id:nav-link-accountList-nav-line-1
${SIGIN_CREATEACCOUNT_BUTTON}        id:createAccountSubmit
${CONDITION_OF_USE}                  //a[contains(text(),"Conditions of Use")]
${PRIVACY_NOTICE}                    //a[contains(text(),"Privacy Notice")]
${CREATE_BUSINESS_ACCOUNT}           id:ab-registration-link
${DONT_CHANGE_ADDRESS}               //input[@data-action-type="DISMISS"]

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
Open home page
    Open Browser                    https://www.amazon.com    browser=headlesschrome
    Wait Until Location Contains    www.amazon.com

Open sign-in page
    Open Browser                    https://www.amazon.com    browser=headlesschrome
    Click Element                   ${HOME_SIGNIN_BUTTON}
    Wait Until Location Contains    signin

Open create-account page from sign in page
    Open Browser                    https://www.amazon.com    browser=headlesschrome
    Click Element                   ${HOME_SIGNIN_BUTTON}
    Click Element                   ${SIGIN_CREATEACCOUNT_BUTTON}
    Wait Until Location Contains    register

Open create-business-account from create-account page
    Open Create-Account Page
    Click Element                   ${CREATE_BUSINESS_ACCOUNT}
    Wait Until Location Contains    business/register
    Wait Until Page Contains        Let's create your free Amazon Business account
    Title Should Be                 Amazon Business

Open condition of use from sign in page 
    Open Sign-In Page
    Click Element                   ${CONDITION_OF_USE}
    Wait Until Location Contains    condition_of_use
    Wait Until Page Contains        Conditions of Use
    Title Should Be                 Conditions of Use - Amazon Customer Service

Open condition of use from create-account page 
    Open Create-Account Page
    Click Element                   ${CONDITION_OF_USE}
    Wait Until Location Contains    condition_of_use
    Wait Until Page Contains        Conditions of Use
    Title Should Be                 Conditions of Use - Amazon Customer Service

Open privacy notice from sing in page
    Open Sign-In Page
    Click Element                    ${PRIVACY_NOTICE}
    Wait Until Location Contains    privacy_notice
    Wait Until Page Contains        Privacy Notice
    Title Should Be                 Amazon.com Privacy Notice - Amazon Customer Service

Open privacy notice from create-account page
    Open Create-Account Page
    Click Element                   ${PRIVACY_NOTICE}
    Wait Until Location Contains    privacy_notice
    Wait Until Page Contains        Privacy Notice
    Title Should Be                 Amazon.com Privacy Notice - Amazon Customer Service

Open Cart Page (Signed out user)
    Open Home Page
    Click Element                    id:nav-cart-count
    Wait Until Location Contains     gp/cart
    Wait Until Page Contains         Your Amazon Cart is empty
    Title Should Be                  Amazon.com Shopping Cart

Open Today's Deals Page from homepage
    Open Home Page
    Click Element                    //a[contains(text(),"Today's Deals")]
    Wait Until Location Contains     gp/goldbox
    Wait Until Page Contains         Today's Deals
    Title Should Be                  Amazon.com - Today's Deals

Open Customer Service Page from homepage
    Open Home Page
    Click Element                    //a[contains(text(),"Customer Service")]
    Wait Until Location Contains    gp/help/customer
    Wait Until Page Contains        Welcome to Amazon Customer Service
    Title Should Be                 Amazon Customer Service Support – Amazon.com

Open Registry Page from homepage
    Open Home Page
    Click Element                   //a[contains(text(),"Registry")]
    Wait Until Location Contains    /registries
    Wait Until Page Contains        Find a registry or gift list
    Title Should Be                 Amazon Registry & Gifting

Open Gift Cards Page from homepage
    Open Home Page
    Click Element                   //a[contains(text(),"Gift Cards")]
    Wait Until Location Contains    /gift-cards
    Wait Until Page Contains        Shop the perfect gift card
    Title Should Be                 Amazon.com Gift Cards

Open Sell Page from homepage
    Open Home Page
    Click Element                   //a[contains(text(),"Sell")][@data-csa-c-slot-id="nav_cs_4"]
    Wait Until Location Contains    nav_cs_sell
    Wait Until Page Contains        Become an Amazon seller
    Title Should Be                 Amazon.com: Sell Products Online with Selling on Amazon.

