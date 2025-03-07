*** Settings ***

Resource    Resources/commons.robot

Test Teardown    Ending the test

*** Variables ***
${TABLE}    //*[@id="bat-board"]

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling WebTables
    launching browser  https://imsports.rediff.com/score/in_asa_1081672.html    chrome

    @{rows}=    get webelements    ${TABLE}//tr
    ${rowCount}=    get length    ${rows}
    @{cols}=    get webelements    ${TABLE}//tr[1]/td
    ${colCount}=    get length    ${cols}


    log to console    Total rows are ${rowCount} and Total cols are ${colCount}


    #Print the table data

    FOR    ${i}    IN    @{rows}
        ${text}=    get text    ${i}
        log to console    ${text}
    END


    table should contain            xpath:${TABLE}      Suranga Lakmal
    # Row 3
    table row should contain        ${TABLE}//tr        3    	b Shami
    table row should contain        ${TABLE}//tr        3    	30.77

    # Column 7 and 2
    table column should contain     ${TABLE}//tr[1]/td  7       133.33
    table column should contain     ${TABLE}//tr[1]/td  2       b Shami

    sleep    3s