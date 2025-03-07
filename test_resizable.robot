*** Settings ***

Resource    Resources/commons.robot

Test Teardown    Ending the test

*** Variables ***
${OFFSET_X}    400
${OFFSET_Y}    200

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Resizable
    launching browser  https://jqueryui.com/resources/demos/resizable/default.html    chrome
    sleep    3s

    drag and drop by offset    xpath://*[@id="resizable"]/div[3]    ${OFFSET_X}    ${OFFSET_Y}

    sleep    3s