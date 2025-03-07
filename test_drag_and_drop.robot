*** Settings ***

Resource    Resources/commons.robot

Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Drag and Drop
    launching browser  https://jqueryui.com/resources/demos/droppable/default.html    chrome
    drag and drop    id:draggable    id:droppable

    sleep    3s
