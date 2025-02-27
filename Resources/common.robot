*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Launching Browser
    [Documentation]    使用先前设置的浏览器选项, 打开页面
    [Arguments]     ${url}      ${browserName}  ${waitTime}  ${options}
    IF    '${options}' != 'None'
        Open Browser    ${url}    ${browserName}    options=${options}
    ELSE
         Open Browser    ${url}    ${browserName}
    END
    Set Selenium Implicit Wait    ${waitTime}
    Log    Opening Gmail Login Page ${url} with ${browserName} browser
    Log title

Finish Test Case
    log    Ending the test case
    close browser