*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py
#Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Dropdown list
    launching browser  https://way2automation.com/way2auto_jquery/index.php    chrome
    click link    link:ENTER TO THE TESTING WEBSITE
    click element    xpath://*[@id="wrapper"]/div/div/div[6]/ul/li/a/figure
    @{windowHandles}=    get window handles
    switch window    ${windowHandles}[1]
    select frame    xpath://*[@id="example-1-tab-1"]/div/iframe
    click button    xpath:/html/body/button
    ${alert}=    handle alert    action=DISMISS
    log to console    ${alert}
    unselect frame
    click element    xpath://*[@id="wrapper"]/div[1]/div[1]/div[1]/ul/li[2]/a
    select frame    xpath://*[@id="example-1-tab-2"]/div/iframe
    click button    xpath:/html/body/button
    input text into alert    Rahul Arora
