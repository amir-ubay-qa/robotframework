*** Settings ***
Library    SeleniumLibrary
Resource   ./variables.robot

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