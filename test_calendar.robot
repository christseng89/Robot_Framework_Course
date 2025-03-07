*** Settings ***
Resource    Resources/commons.robot
Library    AllureLibrary
Library    Built_In/CustomLib.py

Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

Teardown
    run keyword if test failed    Capture Screenshot

*** Test Cases ***

Handling Calendar
    [Teardown]    Teardown
    launching browser    https://www.way2automation.com/way2auto_jquery/datepicker.php#load_box    chrome
    select frame    //*[@id="example-1-tab-1"]/div/iframe
    click element    id:datepicker

    # Debug prints
    Print Console
    Print Title

    select month    //*[@id="ui-datepicker-div"]/div/div/span[1]    January    14
