*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py
Test Teardown    Ending the test

*** Variables ***
${OFFSET_X}    400
${OFFSET_Y}    0

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Sliders
    launching browser  https://jqueryui.com/resources/demos/slider/default.html    chrome   options=${MOUSE_OPTION}
    drag and drop by offset    xpath://*[@id="slider"]/span    ${OFFSET_X}    ${OFFSET_Y}

    sleep    5s