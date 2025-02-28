*** Settings ***
Library     SeleniumLibrary
# Variables   locators_gmail.py

*** Keywords ***
Set Browser Options
    [Documentation]    配置浏览器选项
    [Arguments]    ${browser_type}
    Log    Setting browser options for ${browser_type}
    ${options}=    Evaluate    None
    IF    '${browser_type}'.lower() == 'chrome'
        ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --incognito
        Call Method    ${options}    add_argument    --disable-blink-features\=AutomationControlled
        Call Method    ${options}    add_argument    --start-maximized
        Call Method    ${options}    add_argument    --disable-gpu
    ELSE IF    '${browser_type}'.lower() == 'firefox'
        ${options}=    Evaluate    selenium.webdriver.FirefoxOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --private
        Call Method    ${options}    add_argument    --kiosk
    END
    RETURN    ${options}

Launching Browser
    [Documentation]    使用先前设置的浏览器选项, 打开页面
    [Arguments]    ${url}    ${browserName}    ${waitTime}    ${options}
    IF    '${options}' != 'None'
        Open Browser    ${url}    ${browserName}    options=${options}
    ELSE
        Open Browser    ${url}    ${browserName}
    END
    Set Selenium Implicit Wait    ${waitTime}
    Log    Opening Gmail Login Page ${url} with ${browserName} browser
    Log Title

Verify Error Element Exists
    [Documentation]    验证是否存在错误元素
    [Arguments]    ${locator}    ${error_message}    ${screenshot_filename}=error.png
    ${exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT_SHORT}
    IF    ${exists}
        Log    ${error_message}
        Capture Page Screenshot    ${screenshot_filename}
        Fail    ${error_message}
    END

Verify Element Exists
    [Documentation]    验证页面上的普通元素
    [Arguments]    ${locator}    ${error_message}    ${screenshot_filename}=element_not_found.png
    ${exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT_LONG}
    IF    not ${exists}
        Log    ${error_message}
        Capture Page Screenshot    ${screenshot_filename}
        Fail    ${error_message}
    ELSE
        Log    Element found: ${locator}
    END

Finish Test Case
    Log    Ending the test case
    Close Browser
