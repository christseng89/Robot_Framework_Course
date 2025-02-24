*** Settings ***
Library     SeleniumLibrary


*** Keywords ***

*** Variables ***
${URL}      https://www.outlook.com/
${BROWSER}  chrome

*** Test Cases ***

Basic Test Case
    log     Basic Test case
    open browser    ${URL}    ${BROWSER}
    log title
    sleep    3
    close browser

Second Test Case
    log     Second Test case
