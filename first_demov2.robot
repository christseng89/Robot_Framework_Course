*** Settings ***
Documentation       测试 Gmail 登录功能 Using '${BROWSER}'

Library             SeleniumLibrary
Resource            config.robot
Resource            Resources/common.robot
# Store browser elements into a Python file
Variables           Resources/locators_gmail.py

Test Setup          Set Up Test Environment
Test Teardown       Finish Test Case


*** Variables ***
${TIMEOUT}          ${TIMEOUTS}[0]
${TIMEOUT_SHORT}    ${TIMEOUTS}[1]
${TIMEOUT_LONG}     ${TIMEOUTS}[2]
${BROWSER}          ${browsers["${BROWSER_TYPE}"]}
${LOGIN_URL}        https://gmail.com
${EMAIL}            ${config.email}
${PASSWORD}         ${config.password}


*** Test Cases ***
Gmail Login Test
    Input Email    ${EMAIL}
    Verify Email Invalid
    Input Password    ${PASSWORD}
    Verify Password Invalid
    Verify Login Successful


*** Keywords ***
Open Login Page
    [Arguments]    ${options}
    Launching Browser    ${LOGIN_URL}    ${BROWSER}    ${TIMEOUT}    ${options}

Set Up Test Environment
    ${options}=    Set Browser Options    ${BROWSER}
    Open Login Page    ${options}

Input Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${email_input}    timeout=${TIMEOUT_SHORT}
    Input Text    ${email_input}    ${email}
    Click Element    ${next_button}
    Log    Entered email and clicked next

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${password_input}    timeout=${TIMEOUT_SHORT}
    Input Text    ${password_input}    ${password}
    Wait Until Element Is Visible    ${password_next_button}    timeout=${TIMEOUT_SHORT}
    Scroll Element Into View    ${password_next_button}
    Execute JavaScript    document.getElementById('passwordNext').click()
    Log    Entered password and clicked next

Verify Email Invalid
    Verify Error Element Exists    ${email_error}    Incorrect Email! Couldn’t find Google Account.

Verify Password Invalid
    Verify Error Element Exists    ${password_error}    Incorrect Password! Please try again.

Verify Login Successful
    Verify Element Exists    ${gmail_logo}    Login failed! Gmail logo not found.
