*** Settings ***
Resource            ../Resources/commons.robot
Library             SeleniumLibrary
Library             AllureLibrary
Library             ../Built_In/CustomLib.py
Library             DataDriver    ../Resources/testdata.xlsx    sheet_name=Sheet1

Test Teardown       Ending the test
Test Template       Handling Calendar With Excel Data


*** Test Cases ***
Handling Calendar    ${month}    ${date}
    [Teardown]    Teardown


*** Keywords ***
Ending the test
    Close Browser

Teardown
    Run Keyword If Test Failed    Capture Screenshot
    Finish Test Case

Handling Calendar With Excel Data
    [Arguments]    ${month}    ${date}
    Launching browser    https://www.way2automation.com/way2auto_jquery/datepicker.php#load_box    chrome
    Select Frame    //*[@id="example-1-tab-1"]/div/iframe
    Click Element    id:datepicker

    # Debug prints
    Print Console
    Print Title

    # Use Excel data dynamically here
    Select Month    //*[@id="ui-datepicker-div"]/div/div/span[1]    ${month}    ${date}
    log to console    Month: ${month}, Date: ${date}
    element text should be    //*[@id="ui-datepicker-div"]/div/div/span[1]    ${month}
