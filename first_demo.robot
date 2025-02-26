*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Resource    config.robot  # ✅ Import credentials from an external file

*** Variables ***
${TIMEOUT}          ${TIMEOUT_SECONDS}
${TIMEOUT_SHORT}    ${TIMEOUT_SECONDS_SHORT}

${BROWSER}           Chrome
${LOGIN_URL}         https://accounts.google.com/signin

${EMAIL}             ${EMAIL_ACCOUNT}  # ✅ Load from config file
${EMAIL_ERROR_XPATH}  //div[@class="dEOOab RxsGPe"]/div[@class="Ekjuhf Jj6Lae"]

${PASSWORD}          ${EMAIL_PASSWORD}  # ✅ Load from config file
${PASSWORD_ERROR_XPATH}  //span[contains(text(),"Wrong password")]  # Correct XPath for "Wrong password"

${GMAIL_LOGO_XPATH}  //*[@id="gb"]/div[2]/div[1]/div[4]/div/a  # Given XPath for Gmail Logo

*** Test Cases ***
Login To Gmail With Verification
    # ✅ Create ChromeOptions object
    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    sys, selenium.webdriver

    # ✅ Add Chrome arguments
    Call Method    ${chrome_options}    add_argument    --incognito
    Call Method    ${chrome_options}    add_argument    --disable-blink-features\=AutomationControlled
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --disable-gpu

    # ✅ Open Chrome with configured options
    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${chrome_options}
    set selenium implicit wait    ${TIMEOUT}

    # ✅ Enter Email and Click Next
    Wait Until Element Is Visible    name:identifier
    Input Text    name:identifier    ${EMAIL}
    Click Element    //*[@id="identifierNext"]

    # Check inavlid email address
    ${is_email_invalid}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${EMAIL_ERROR_XPATH}    timeout={TIMEOUT_SHORT}

    Run Keyword If    ${is_email_invalid}    Run Keywords
    ...    Log    Incorrect Email! Couldn’t find Google Account.
    ...    Capture Page Screenshot
    ...    Fail    Login failed due to incorrect email.

    # ✅ Enter Password and Click Next
    Wait Until Element Is Visible    name:Passwd
    Input Text    name:Passwd    ${PASSWORD}
    Click Element    //*[@id="passwordNext"]

    # Check invalid password
    ${is_password_invalid}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${PASSWORD_ERROR_XPATH}    timeout={TIMEOUT_SHORT}

    Run Keyword If    ${is_password_invalid}    Run Keywords
    ...    Log    Incorrect Password! Please try again.
    ...    Capture Page Screenshot
    ...    Fail    Login failed due to incorrect password.

    # ✅ Verification: Check for Gmail logo (20s timeout)
    ${is_logged_in}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${GMAIL_LOGO_XPATH}

    # ✅ Determine test result
    Run Keyword If    ${is_logged_in}    Log    Gmail login successful!
    Run Keyword If    not ${is_logged_in}    Run Keywords
    ...    Log    Gmail login failed!
    ...    Capture Page Screenshot
    ...    Fail    Login was not successful.

    # ✅ Close browser after test
    Close Browser
