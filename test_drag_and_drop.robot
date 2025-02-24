*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py
#Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Drag and Drop
    launching browser  https://jqueryui.com/resources/demos/droppable/default.html    chrome
    drag and drop    id:draggable    id:droppable