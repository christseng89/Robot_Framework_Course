*** Settings ***
Resource    Resources/commons.robot
Variables    Resources/locators.py
Test Teardown    Ending the test

*** Variables ***
${INPUT_TEXT}    Rahul Arora
${EXPECTED_TEXT}    Hello ${INPUT_TEXT}! How are you today?

*** Keywords ***
Ending the test
    Run Keyword And Ignore Error    Capture Page Screenshot
    close browser

*** Test Cases ***

Handling Dropdown list
    launching browser    https://way2automation.com/way2auto_jquery/index.php    chrome
    maximize browser window

    click link    link:ENTER TO THE TESTING WEBSITE

    # Clicking 'Alerts' link and switch window
    click element    xpath://*[@id="wrapper"]/div/div/div[6]/ul/li/a/h2
    @{windowHandles}=    get window handles
    switch window    ${windowHandles}[1]

    # Simple Alert (works)
    select frame    xpath://*[@id="example-1-tab-1"]/div/iframe
    click button    xpath:/html/body/button
    sleep    3s

    ${alert_text}=    handle alert    action=ACCEPT
    log to console    \nSimple Alert Text: ${alert_text}

    # Input Alert (revised and fixed)
    unselect frame
    click element    xpath://*[@id="wrapper"]/div[1]/div[1]/div[1]/ul/li[2]/a
    select frame    xpath://*[@id="example-1-tab-2"]/div/iframe
    click button    xpath:/html/body/button
    sleep    3s

    # ✅ Do NOT try to detect the alert manually - just immediately input text and accept
    input text into alert    ${INPUT_TEXT}    action=ACCEPT
    # ✅ After accepting, check the text in #demo
    ${actual_text}=    get text    xpath://*[@id="demo"]
    log to console    \nText after alert: ${actual_text}

    should be equal    ${actual_text}    ${EXPECTED_TEXT}

    unselect frame
    sleep    2s
