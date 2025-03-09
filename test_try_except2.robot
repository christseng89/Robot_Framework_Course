*** Settings ***
Documentation       Learning Try and Except - Exception handling

# Library    BuiltIn
Library             SeleniumLibrary


*** Variables ***
${EMAIL_ID}     identifierId


*** Test Cases ***
Selenium Try / Except
    [Documentation]    Try and Except Selenium
    TRY
        open browser    https://gmail.com    chrome
        maximize browser window
        input text    id:${EMAIL_ID}    test123@gmail.com
    EXCEPT
        log to console    ❌ Selenium Test with Invalid input element ${EMAIL_ID}
    ELSE
        log to console    ✅ Selenium Test with Valid input element ${EMAIL_ID}
    FINALLY
        close browser
    END


*** Keywords ***
Divide
    [Arguments]    ${a}    ${b}
    ${status}    ${result}=    Run Keyword And Ignore Error    Evaluate    ${a} / ${b}
#    status = PASS or FAIL
    RETURN    ${status}    ${result}
