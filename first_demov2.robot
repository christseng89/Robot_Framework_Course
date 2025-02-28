*** Settings ***
Documentation    本测试套件验证 Gmail 的基本登录功能
Library           SeleniumLibrary
Resource          config.robot
Resource          Resources/common.robot

Test Setup        Set Up Test Environment
Test Teardown     Finish Test Case

*** Variables ***
${TIMEOUT}            ${TIMEOUTS}[0]
${TIMEOUT_SHORT}      ${TIMEOUTS}[1]
${TIMEOUT_LONG}       ${TIMEOUTS}[2]
${BROWSER}            ${browsers["${BROWSER_TYPE}"]}
${LOGIN_URL}          https://gmail.com
${EMAIL}              ${config.email}
${EMAIL_ERROR_XPATH}  //div[@class="dEOOab RxsGPe"]/div[@class="Ekjuhf Jj6Lae"]
${PASSWORD}           ${config.password}
${PASSWORD_ERROR_XPATH}  //span[contains(text(),"Wrong password")]
${GMAIL_LOGO_XPATH}   //*[@id="gb"]/div[2]/div[1]/div[4]/div/a

*** Keywords ***
Open Login Page
    [Documentation]    打开 ${LOGIN_URL} 页面
    [Arguments]    ${options}
    Launching Browser    ${LOGIN_URL}    ${BROWSER}    ${TIMEOUT}    ${options}

Set Up Test Environment
    ${options}=    Set Browser Options    ${BROWSER}
    Open Login Page    ${options}

Input Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    name:identifier
    Input Text    name:identifier    ${email}
    Click Element    //*[@id="identifierNext"]
    Log    Entered email and clicked next

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    name:Passwd
    Input Text    name:Passwd    ${password}
    Wait Until Element Is Visible    //*[@id="passwordNext"]    timeout=${TIMEOUT_SHORT}
    Scroll Element Into View    //*[@id="passwordNext"]
    Execute JavaScript    document.getElementById('passwordNext').click()
    Log    Entered password and clicked next

Verify Email Invalid
    Verify Error Element Exists    ${EMAIL_ERROR_XPATH}    Incorrect Email!

Verify Password Invalid
    Verify Error Element Exists    ${PASSWORD_ERROR_XPATH}    Incorrect Password!

Verify Login Successful
    Verify Element Exists    ${GMAIL_LOGO_XPATH}    Login failed!

*** Test Cases ***
Gmail Login Test
    [Documentation]    测试 Gmail 的基本登录功能
    Input Email    ${EMAIL}
    Verify Email Invalid
    Input Password    ${PASSWORD}
    Verify Password Invalid
    Verify Login Successful