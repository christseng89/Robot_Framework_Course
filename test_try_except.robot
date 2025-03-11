*** Settings ***
Documentation       Learning Try and Except - Exception handling

Library             BuiltIn


*** Variables ***
${DIVISOR}      2


*** Test Cases ***
Sample Try / Except
    [tags]    try_except
    [Documentation]    Simple Try and Except
    TRY
        log to console    \n✅ Hello World
         Fail    ; No fail to see the else block working
        log to console    ✅ Doing great
    EXCEPT
        log to console    ❌ Exception occurred
    ELSE
        log to console    ✅ Else No exception occurred
    FINALLY
        log to console    ✅ Finally block executed
    END

First Try / Except
    [Documentation]    Try and Except1
    ${status}=    Set Variable    FAIL
    TRY
        ${status}    ${result}=    Divide    10    ${DIVISOR}
        IF    '${status}' == 'PASS'
            log to console    \n✅ 1st Division Result: ${result}, status: ${status}
        ELSE
            fail
        END
    EXCEPT
        Handle division Exception    ${status}
    END

Second Try / Except - Message Reported
    [Documentation]    Try and Except2
    ${status}=    Set Variable    FAIL
    TRY
        ${status}    ${result}=    Divide    10    ${DIVISOR}
        IF    '${status}' == 'PASS'
            log to console    \n✅ 2nd Division Result: ${result}, status: ${status}
        ELSE
            fail    Error occurred during division
        END
    EXCEPT
        Handle division Exception    ${status}
    END

Third Try / Except - Function
    [Documentation]    Try and Except3
    ${status}=    Set Variable    FAIL
    TRY
        ${status}    ${result}=    Divide    10    ${DIVISOR}
        IF    '${status}' == 'PASS'
            log to console    \n✅ 3rd Division Result: ${result}, status: ${status}
        ELSE
            fail    ZeroDivisionError
        END
    EXCEPT
        Handle division Exception    ${status}
    FINALLY
        log to console    FIANLLY: status: ${status}
    END


*** Keywords ***
Divide
    [Arguments]    ${a}    ${b}
    ${status}    ${result}=    Run Keyword And Ignore Error    Evaluate    ${a} / ${b}
#    status = PASS or FAIL
    RETURN    ${status}    ${result}

Handle division Exception
    [Arguments]    ${status}
    log to console    \n❌ Except: Cannot divide by ${DIVISOR}, status: ${status}
