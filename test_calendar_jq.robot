*** Settings ***
Library             SeleniumLibrary
Library             AllureLibrary
Library             Built_In/CustomLib.py

Suite Setup         Open Browser    https://jqueryui.com/datepicker/    chrome
Suite Teardown      Close Browser


*** Test Cases ***
Test Custom Library
    Maximize Browser Window
#    Sleep    5s
    Wait Until Element Is Visible    xpath=//iframe[@class='demo-frame']    timeout=3s
    Select Frame    xpath=//iframe[@class='demo-frame']
    Wait Until Element Is Visible    id=datepicker
    Click Element    id=datepicker

    # Corrected keyword call:
    Select Month    //span[@class='ui-datepicker-month']    June    15

    Unselect Frame
    Print Title
    Capture Screenshot
    Print Console
