*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py
#Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Sliders
    launching browser  https://jqueryui.com/resources/demos/slider/default.html    chrome
    drag and drop by offset    xpath://*[@id="slider"]/span    400    0