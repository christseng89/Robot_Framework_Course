*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py

*** Variables ***
${URL_WAY2AUTO}    https://www.way2automation.com/way2auto_jquery/index.php
${BROWSER}    chrome

*** Keywords ***


*** Test Cases ***

Registration form test
    Filling Registration form    ${URL_WAY2AUTO}  ${BROWSER}
    Finish Test Case
