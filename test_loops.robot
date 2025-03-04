*** Variables ***
@{city}=    Delhi    Mumbai    Goa
*** Test Cases ***
Test for Loop
    FOR    ${i}    IN RANGE    5
        IF    ${i} == 0
            log to console    \n
        END
        log to console    ${i}
    END

Test for Loop in Range
    FOR    ${i}    IN RANGE    1    10    2
        IF    ${i} == 1
            log to console    \n
        END
        log to console    ${i}
    END

Test for Loop in Range and Exit
    FOR    ${i}    IN RANGE    1    10
        IF    ${i} == 1
            log to console    \n
        END
        log to console      ${i}
        exit for loop if    ${i} == 7
    END

Test for Loop in List of Elements
    ${first_city}=    Set Variable    ${city}[0]
    FOR    ${i}    IN    @{city}
        IF    '${i}' == '${first_city}'
            log to console    \n
        END
        log to console    ${i}
        exit for loop if    '${i}' == 'Mumbai'
    END