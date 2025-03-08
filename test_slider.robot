*** Settings ***
Resource            Resources/commons.robot

Test Teardown       Ending the test


*** Variables ***
${OFFSET_X}     400
${OFFSET_Y}     0


*** Test Cases ***
Handling Sliders
    launching browser    https://jqueryui.com/resources/demos/slider/default.html    chrome
    drag and drop by offset    xpath://*[@id="slider"]/span    ${OFFSET_X}    ${OFFSET_Y}

    sleep    2s


*** Keywords ***
Ending the test
    close browser
