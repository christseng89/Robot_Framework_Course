*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${TEST_URL}             https://www.w3schools.com/js/tryit.asp?filename=tryjs_myfirst
${WEB_ELEMENT}          xpath=//button[contains(text(),'Click me')]
${OUTPUT_ELEMENT}       xpath=//p[@id='demo']


*** Test Cases ***
Test JavaScript Function Execution
    Open Browser    ${TEST_URL}    chrome
    Maximize Browser Window

    # Ensure iframe is present before switching
    Wait Until Element Is Visible    xpath=//iframe[@id="iframeResult"]    timeout=10s
    Select Frame    xpath=//iframe[@id="iframeResult"]

    # Debugging step: Log all buttons found
    @{buttons}=    Get WebElements    //button
    Wait Until Element Is Visible    ${WEB_ELEMENT}    timeout=10s
    Log To Console    \nFound Web Element: ${WEB_ELEMENT}

    # Highlight the button for debugging
    ${element}=    Get WebElement    ${WEB_ELEMENT}
    Execute JavaScript    arguments[0].style.border='3px solid red'    ARGUMENTS    ${element}
    execute javascript    arguments[0].click();    ARGUMENTS    ${element}
#    Click Element    ${WEB_ELEMENT}

    # Wait for the JavaScript function to update the paragraph
    Wait Until Element Is Visible    ${OUTPUT_ELEMENT}    timeout=10s
    ${new_text}=    Get Text    ${OUTPUT_ELEMENT}
    log to console    \n'Click me' Output: ${new_text}

    # Verify the output contains a timestamp (JavaScript date)
    Should Not Be Empty    ${new_text}

    Capture Element Screenshot    ${element}    EMBED
    Unselect Frame
    Capture Page Screenshot    fullpage.png
    Sleep    2s
    Close Browser
