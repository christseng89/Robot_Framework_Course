*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Set Browser Options
    [Documentation]    配置浏览器选项
    [Arguments]    ${browser_type}
    Log    Setting browser options for ${browser_type}
    ${options}=    Evaluate    None    # Reset options within the keyword
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
    [Arguments]    ${element_xpath}    ${error_message}    ${screenshot_filename}=screenshot.png
    ${element_exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${element_xpath}    timeout=${TIMEOUT_SHORT}
    IF    ${element_exists}
        Log    ${error_message}
        Capture Page Screenshot    ${screenshot_filename}
        Fail    ${error_message}
    END

Verify Element Exists
    [Documentation]    验证是否存在元素
    [Arguments]    ${element_xpath}    ${error_message}    ${screenshot_filename}=screenshot.png
    ${element_exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${element_xpath}    timeout=${TIMEOUT_LONG}
    IF    ${element_exists}
        Log    Login successful!
    ELSE
        Log    ${error_message}
        Capture Page Screenshot    ${screenshot_filename}
        Fail    ${error_message}
    END

Finish Test Case
    Log    Ending the test case
    Close Browser