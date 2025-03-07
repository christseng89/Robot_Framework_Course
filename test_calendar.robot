*** Settings ***
Resource            Resources/commons.robot
Library             AllureLibrary
Library             Built_In/CustomLib.py

Test Teardown       Ending the test


*** Test Cases ***
Handling Calendar
    launching browser    https://www.way2automation.com/way2auto_jquery/datepicker.php#load_box    chrome
    select frame    xpath=//iframe[contains(@src, 'datepicker/defult1.html')]
    click element    id:datepicker

    # Debug prints
    Print Console
    Print Title

    select month    //*[@id="ui-datepicker-div"]/div/div/span[1]    January    14

    sleep    3s

    ${text}=    get value    xpath://input[@id="datepicker"]
    log to console    \nSelected Date: ${text}
    [Teardown]    Teardown


*** Keywords ***
Ending the test
    close browser

Teardown
    run keyword if test failed    Capture Screenshot
