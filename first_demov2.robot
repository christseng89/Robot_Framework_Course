*** Settings ***
Library           SeleniumLibrary
Resource          config.robot  # Import credentials and settings
Test Setup        Open Login Page
Test Teardown     Close Browser

*** Variables ***
${TIMEOUT}            ${TIMEOUT_SECONDS}
${TIMEOUT_SHORT}      ${TIMEOUT_SECONDS_SHORT}
${BROWSER}            ${BROWSER_TYPE}
${LOGIN_URL}          https://gmail.com
${EMAIL}              ${EMAIL_ACCOUNT}
${EMAIL_ERROR_XPATH}  //div[@class="dEOOab RxsGPe"]/div[@class="Ekjuhf Jj6Lae"]
${PASSWORD}           ${EMAIL_PASSWORD}
${PASSWORD_ERROR_XPATH}  //span[contains(text(),"Wrong password")]
${GMAIL_LOGO_XPATH}   //*[@id="gb"]/div[2]/div[1]/div[4]/div/a

*** Keywords ***
Open Login Page
    ${options}=    Evaluate    None
    IF    '${BROWSER}'.lower() == 'chrome'
       ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    sys, selenium.webdriver
       Call Method    ${options}    add_argument    --incognito
       Call Method    ${options}    add_argument    --disable-blink-features\=AutomationControlled
       Call Method    ${options}    add_argument    --start-fullscreen
       Call Method    ${options}    add_argument    --disable-gpu
    ELSE IF    '${BROWSER}'.lower() == 'firefox'
       ${options}=    Evaluate    selenium.webdriver.FirefoxOptions()    sys, selenium.webdriver
       Call Method    ${options}    add_argument    --private
       Call Method    ${options}    add_argument    --kiosk  # Opens Firefox in full-screen mode

    END
    IF    '${options}' != 'None'
        Log    Browser options: ${options}
    END
    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${options}
    Set Selenium Implicit Wait    ${TIMEOUT}
    Log    Opening Gmail Login Page

Input Email
    [Arguments]  ${email}
    Wait Until Element Is Visible    name:identifier
    Input Text    name:identifier    ${email}
    Click Element    //*[@id="identifierNext"]
    Log    Entered email and clicked next

Input Password
    [Arguments]  ${password}
    Wait Until Element Is Visible    name:Passwd
    Input Text    name:Passwd    ${password}
    Wait Until Element Is Visible    //*[@id="passwordNext"]    timeout=${TIMEOUT_SHORT}
    Scroll Element Into View    //*[@id="passwordNext"]
    Execute JavaScript    document.getElementById('passwordNext').click()
    Log    Entered password and clicked next

Verify Email Invalid
    ${is_email_invalid}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${EMAIL_ERROR_XPATH}    timeout=${TIMEOUT_SHORT}
    IF    ${is_email_invalid}
        Log    Incorrect Email! Couldn’t find Google Account.
        Capture Page Screenshot
        Fail    Login failed due to incorrect email.
    END

Verify Password Invalid
    ${is_password_invalid}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${PASSWORD_ERROR_XPATH}    timeout=${TIMEOUT_SHORT}
    IF    ${is_password_invalid}
        Log    Incorrect Password! Please try again.
        Capture Page Screenshot
        Fail    Login failed due to incorrect password.
    END

Verify Login Successful
    ${is_logged_in}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${GMAIL_LOGO_XPATH}    timeout=20s
    IF    ${is_logged_in}
        Log    Gmail login successful!
    ELSE
        Log    Gmail login failed!
        Capture Page Screenshot
        Fail    Login was not successful.
    END

*** Test Cases ***
Gmail Login Test
    [Documentation]    Tests basic Gmail login functionality.
    Input Email
    ...    ${EMAIL}
    Verify Email Invalid
    Input Password
    ...    ${PASSWORD}
    Verify Password Invalid
    Verify Login Successful

