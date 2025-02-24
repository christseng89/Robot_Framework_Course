*** Variables ***
@{city}=    Delhi    Mumbai    Goa
*** Test Cases ***
For Loop
    FOR    ${i}    IN RANGE    5
        log to console    ${i+1}
    END

For loop in range
    FOR    ${i}    IN RANGE    1    10    2
        log to console    ${i}
    END

For loop in range and exit
    FOR    ${i}    IN RANGE    1    10
        log to console    ${i}
        exit for loop if    ${i} == 5
    END

For loop in list of elements
    FOR    ${i}    IN    @{city}
        log to console    ${i}
        exit for loop if    '${i}' == 'Mumbai'
    END