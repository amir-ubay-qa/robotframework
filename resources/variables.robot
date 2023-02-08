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
