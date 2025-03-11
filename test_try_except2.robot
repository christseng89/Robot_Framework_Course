*** Settings ***
Documentation       Learning Try and Except - Exception handling

# Library    BuiltIn
Library             SeleniumLibrary
Library             AllureLibrary
Library             Built_In/CustomLib.py    # Fix the import


*** Variables ***
${EMAIL_ID}     identifierId


*** Test Cases ***
Selenium Try / Except
    [Documentation]    Try and Except Selenium
    TRY
        Open Browser    https://gmail.com    chrome    options=add_argument("--disable-gpu")
        Maximize Browser Window
        Input Text    id:${EMAIL_ID}    test123@gmail.com
    EXCEPT
        Log To Console    ❌ Selenium Test with Invalid input element '${EMAIL_ID}'
    ELSE
        Log To Console    ✅ Selenium Test with Valid input element '${EMAIL_ID}'
    FINALLY
        Capture Screenshot
        Close Browser
    END


*** Keywords ***
Divide
    [Arguments]    ${a}    ${b}
    TRY
        ${result}=    Evaluate    ${a} / ${b}
        RETURN    PASS    ${result}
    EXCEPT
        RETURN    FAIL    0
    END
