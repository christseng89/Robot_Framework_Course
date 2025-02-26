*** Settings ***
Library     SeleniumLibrary
Resource    config.robot  # ✅ Import credentials from an external file

*** Keywords ***

*** Variables ***
${TIMEOUT}          ${TIMEOUT_SECONDS}
${TIMEOUT_SHORT}    ${TIMEOUT_SECONDS_SHORT}

${BROWSER}           ${BROWSER_TYPE}
${LOGIN_URL}         https://gmail.com

${EMAIL}             ${EMAIL_ACCOUNT}  # ✅ Load from config file
${EMAIL_ERROR_XPATH}  //div[@class="dEOOab RxsGPe"]/div[@class="Ekjuhf Jj6Lae"]

${PASSWORD}          ${EMAIL_PASSWORD}  # ✅ Load from config file
${PASSWORD_ERROR_XPATH}  //span[contains(text(),"Wrong password")]  # Correct XPath for "Wrong password"

${GMAIL_LOGO_XPATH}  //*[@id="gb"]/div[2]/div[1]/div[4]/div/a  # Given XPath for Gmail Logo

*** Test Cases ***
Basic Test Cases
    Log    Basic Test Case
    # ✅ Open Browser with configured options
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Selenium Implicit Wait    ${TIMEOUT}
    Maximize Browser Window

    # ✅ Enter Email and Click Next
    Wait Until Element Is Visible    name:identifier
    Input Text    name:identifier    ${EMAIL}
    Click Element    //*[@id="identifierNext"]

    # Check for invalid email address
    ${is_email_invalid}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${EMAIL_ERROR_XPATH}    timeout=${TIMEOUT_SHORT}

    Run Keyword If    ${is_email_invalid}    Run Keywords
    ...    Log    Incorrect Email! Couldn’t find Google Account.
    ...    Capture Page Screenshot
    ...    Fail    Login failed due to incorrect email.

    # ✅ Enter Password and Click Next
    Wait Until Element Is Visible    name:Passwd
    Input Text    name:Passwd    ${PASSWORD}

    # ✅ Fix for "ElementClickInterceptedException"
    Wait Until Element Is Visible    //*[@id="passwordNext"]    timeout=${TIMEOUT_SHORT}
    Scroll Element Into View    //*[@id="passwordNext"]
    Sleep    1s   # Allow UI to settle
    Execute JavaScript    document.getElementById('passwordNext').click()

    # Check for invalid password
    ${is_password_invalid}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${PASSWORD_ERROR_XPATH}    timeout=${TIMEOUT_SHORT}

    Run Keyword If    ${is_password_invalid}    Run Keywords
    ...    Log    Incorrect Password! Please try again.
    ...    Capture Page Screenshot
    ...    Fail    Login failed due to incorrect password.

    # ✅ Verification: Check for Gmail logo (20s timeout)
    ${is_logged_in}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${GMAIL_LOGO_XPATH}    timeout=20s

    # ✅ Determine test result
    Run Keyword If    ${is_logged_in}    Log    Gmail login successful!
    Run Keyword If    not ${is_logged_in}    Run Keywords
    ...    Log    Gmail login failed!
    ...    Capture Page Screenshot
    ...    Fail    Login was not successful.

    # ✅ Close browser after test
    Close Browser
