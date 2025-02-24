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
    launching browser  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_submit_get    chrome
    select frame    xpath://*[@id="iframeResult"]
    click button    xpath:/html/body/button
    unselect frame

    @{frames}=    get webelements    xpath://iframe
    ${count}=    get length    ${frames}
    log to console    ${count}