*** Settings ***
Resource            Resources/commons.robot

Test Teardown       Ending the test


*** Variables ***
${OFFSET_X}     400
${OFFSET_Y}     200


*** Test Cases ***
Handling Resizable
    launching browser    https://jqueryui.com/resources/demos/resizable/default.html    chrome
    sleep    2s

    drag and drop by offset    xpath://*[@id="resizable"]/div[3]    ${OFFSET_X}    ${OFFSET_Y}

    sleep    2s


*** Keywords ***
Ending the test
    close browser
