*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py
#Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Mouse over menus
    launching browser  https://www.way2automation.com/    chrome
    mouse over    xpath://*[@id="menu-item-27580"]/a/span[2]
    click link    Lifetime Membership