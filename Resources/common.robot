*** Settings ***
Library     SeleniumLibrary
# Variables    locators_gmail.py


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
        Call Method    ${options}    add_argument    --disable-infobars
#    Call Method    ${options}    add_argument    --disable-popup-blocking
#    Call Method    ${options}    add_argument    --disable-extensions
    ELSE IF    '${browser_type}'.lower() == 'firefox'
        ${options}=    Evaluate    selenium.webdriver.FirefoxOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --private
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

    IF    "$browserName.lower() == 'firefox'"    Maximize Browser Window

    Set Selenium Implicit Wait    ${waitTime}
    Log    Opening Gmail Login Page ${url} with ${browserName} browser
    Log Title

Verify Error Element Exists
    [Documentation]    验证是否存在错误元素
    [Arguments]    ${locator}    ${error_message}    ${screenshot_filename}=error.png

    Check Element Exists
    ...    ${locator}
    ...    ${error_message}
    ...    should_exist=False
    ...    timeout=${TIMEOUT_SHORT}
    ...    screenshot_filename=${screenshot_filename}

Verify Element Exists
    [Documentation]    验证是否存在正常元素
    [Arguments]    ${locator}    ${error_message}    ${screenshot_filename}=error.png

    Check Element Exists
    ...    ${locator}
    ...    ${error_message}
    ...    should_exist=True
    ...    timeout=${TIMEOUT_LONG}
    ...    screenshot_filename=${screenshot_filename}

Check Element Exists    # 通用元素检查
    [Documentation]    通用元素检查，支持正常元素和错误元素
    [Arguments]
    ...    ${locator}
    ...    ${error_message}
    ...    ${should_exist}=True
    ...    ${timeout}=${TIMEOUT_LONG}
    ...    ${screenshot_filename}=error.png

    ${exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=${timeout}

    IF    ${should_exist} == True and not ${exists}
        Log    ${error_message}
        Capture Page Screenshot    ${screenshot_filename}
        Fail    ${error_message}
    ELSE IF    ${should_exist} == False and ${exists}
        Log    ${error_message}
        Capture Page Screenshot    ${screenshot_filename}
        Fail    ${error_message}
    ELSE
        Log    Element check passed: ${locator}
    END

Finish Test Case
    Log    Ending the test case
    Close Browser
