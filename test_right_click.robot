*** Settings ***

Resource    Resources/commons.robot

#Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Right Click - Context Menu
    launching browser  https://deluxe-menu.com/popup-mode-sample.html    chrome
    open context menu    xpath:/html/body/div/table/tbody/tr/td[2]/div[2]/table[1]/tbody/tr/td[3]/p[2]/img
    mouse over    id:dm2m1i1tdT
    mouse over    id:dm2m2i1tdT

    # How to setup
    click element    id:dm2m3i1tdT

    @{windowHandles}=    get window handles
    ${windowCount}=    Get Length    ${windowHandles}
    Log To Console    Length of Window Handles: ${windowCount}

    switch window    ${windowHandles}[1]
    wait until element is visible    xpath:/html/body/div/table/tbody/tr/td[2]/div[2]/table[1]/tbody/tr/td[3]/table[2]/tbody/tr/td[2]    timeout=3s

    sleep    3s