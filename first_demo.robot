*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections

*** Variables ***
${BROWSER}           Chrome
${LOGIN_URL}         https://accounts.google.com/signin
${EMAIL}             samfire5203@gmail.com
${PASSWORD}          t1216#Chris

*** Test Cases ***
Login To Gmail Without Detection
    # ✅ Create ChromeOptions object
    ${chrome_options}=    Set Variable    ${None}
    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    sys, selenium.webdriver

    # ✅ Use Call Method to add Chrome arguments
    Call Method    ${chrome_options}    add_argument    --incognito
    Call Method    ${chrome_options}    add_argument    --disable-blink-features\=AutomationControlled
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --remote-debugging-port\=9222
    Call Method    ${chrome_options}    add_argument    --user-agent\=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36

    # ✅ Open Chrome with configured options
    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${chrome_options}
    Maximize Browser Window

    Wait Until Element Is Visible    name:identifier    timeout=10s
    Input Text    name:identifier    ${EMAIL}
    Sleep    3s
    Click Element    //*[@id="identifierNext"]

    Wait Until Element Is Visible    name:Passwd    timeout=30s
    Input Text    name:Passwd    ${PASSWORD}
    Click Element    //*[@id="passwordNext"]

    Close Browser
