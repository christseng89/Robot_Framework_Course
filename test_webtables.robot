*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py
#Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling WebTables
    launching browser  https://imsports.rediff.com/score/in_asa_1081672.html    chrome

    @{rows}=    get webelements    //*[@id="bat-board"]//tr
    ${rowCount}=    get length    ${rows}
    @{cols}=    get webelements    //*[@id="bat-board"]//tr[1]/td
    ${colCount}=    get length    ${cols}


    log to console    Total rows are ${rowCount} and Total cols are ${colCount}


    #Print the table data

    FOR    ${i}    IN    @{rows}
        ${text}=    get text    ${i}
        log to console    ${text}
    END


    table should contain    xpath://*[@id="bat-board"]    Suranga Lakmal
    table row should contain    //*[@id="bat-board"]//tr    3    	b Shamis
    table column should contain    //*[@id="bat-board"]//tr[1]/td    7    133.33