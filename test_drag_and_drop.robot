*** Settings ***
Resource            Resources/commons.robot

Test Teardown       Ending the test


*** Test Cases ***
Handling Drag and Drop
    launching browser    https://jqueryui.com/resources/demos/droppable/default.html    chrome
    drag and drop    id:draggable    id:droppable

    sleep    2s


*** Keywords ***
Ending the test
    close browser
