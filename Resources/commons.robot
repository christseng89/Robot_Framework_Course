*** Settings ***
Library     SeleniumLibrary
#Library    AllureLibrary

*** Keywords ***
launching browser
    [Arguments]    ${url}    ${browserName}
    open browser    ${url}    ${browserName}
    set selenium implicit wait    10 seconds
    log title

Finish Test Case
    log    Ending the test case
    close browser