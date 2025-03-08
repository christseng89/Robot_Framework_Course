*** Settings ***
Documentation       Suite for testing Gmail login functionality

Library             SeleniumLibrary
Library             BuiltIn
Library             Collections
Resource            config.robot    # Import credentials and settings

Test Setup          Set Up Test Environment
Test Teardown       Close Browser


*** Variables ***
${TIMEOUT}                  ${TIMEOUTS}[0]
${TIMEOUT_SHORT}            ${TIMEOUTS}[1]
${BROWSER}                  Chrome    # Default browser
${LOGIN_URL}                https://accounts.google.com/signin
${EMAIL}                    ${config.email}
${EMAIL_ERROR_XPATH}        //div[@class="dEOOab RxsGPe"]/div[@class="Ekjuhf Jj6Lae"]
${PASSWORD}                 ${config.password}
${PASSWORD_ERROR_XPATH}     //span[contains(text(),"Wrong password")]
${GMAIL_LOGO_XPATH}         //*[@id="gb"]/div[2]/div[1]/div[4]/div/a
${options}                  None    # Initialize options to None at the variable scope


*** Test Cases ***
Login To Gmail With Verification
    [Documentation]    Tests the Gmail login functionality with email and password validation.
    Input Email    ${EMAIL}
    Verify Email Invalid
    Input Password    ${PASSWORD}
    Verify Password Invalid
    Verify Login Successful


*** Keywords ***
Set Browser Options
    [Documentation]    Sets browser options based on the selected browser.
    Log    Setting browser options for ${BROWSER}
    ${options}=    Evaluate    None    # Reset options within the keyword
    IF    '${BROWSER}'.lower() == 'chrome'
        ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --incognito
        Call Method    ${options}    add_argument    --disable-blink-features\=AutomationControlled
        Call Method    ${options}    add_argument    --start-maximized
        Call Method    ${options}    add_argument    --disable-gpu
    ELSE IF    '${BROWSER}'.lower() == 'firefox'
        ${options}=    Evaluate    selenium.webdriver.FirefoxOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --private
        Call Method    ${options}    add_argument    --kiosk    # Opens Firefox in full-screen mode
    END
    Set Test Variable    ${options}    # Make options available to other keywords
    IF    '${options}' != 'None'    Log    Browser options set: ${options}

Open Login Page
    [Documentation]    Opens the Gmail login page with the configured browser and options.
    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${options}
    Set Selenium Implicit Wait    ${TIMEOUT}
    Log    Opened Gmail login page

Set Up Test Environment
    [Documentation]    Sets up the test environment by configuring browser options and opening the login page.
    Set Browser Options
    Open Login Page

Input Email
    [Documentation]    Enters the provided email into the email field and clicks 'Next'.
    [Arguments]    ${email}
    Wait Until Element Is Visible    name:identifier
    Input Text    name:identifier    ${email}
    Click Element    //*[@id="identifierNext"]
    Log    Entered email and clicked next

Input Password
    [Documentation]    Enters the provided password into the password field and clicks 'Next'.
    [Arguments]    ${password}
    Wait Until Element Is Visible    name:Passwd
    Input Text    name:Passwd    ${password}
    Click Element    //*[@id="passwordNext"]
    Log    Entered password and clicked next

Verify Email Invalid
    [Documentation]    Verifies if the email entered is invalid. Fails the test if it is.
    ${is_email_invalid}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${EMAIL_ERROR_XPATH}
    ...    timeout=${TIMEOUT_SHORT}
    IF    ${is_email_invalid}
        Log    Incorrect Email! Couldn’t find Google Account.
        Capture Page Screenshot
        Fail    Login failed due to incorrect email.
    END

Verify Password Invalid
    [Documentation]    Verifies if the password entered is invalid. Fails the test if it is.
    ${is_password_invalid}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${PASSWORD_ERROR_XPATH}
    ...    timeout=${TIMEOUT_SHORT}
    IF    ${is_password_invalid}
        Log    Incorrect Password! Please try again.
        Capture Page Screenshot
        Fail    Login failed due to incorrect password.
    END

Verify Login Successful
    [Documentation]    Verifies if the login was successful by checking for the Gmail logo.
    ${is_logged_in}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${GMAIL_LOGO_XPATH}
    ...    timeout=20s
    IF    ${is_logged_in}
        Log    Gmail login successful!
    ELSE
        Log    Gmail login failed!
        Capture Page Screenshot
        Fail    Login was not successful.
    END
