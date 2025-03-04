*** Variables ***
${NAME}=    Rahula
${num1}=    12
${num2}=    20
${num3}=    9

*** Test Cases ***
Test If Block
    IF    "${NAME}" == "Rahul"
        Log To Console    Name is Rahul
    ELSE
        Log To Console    Name is not Rahul
    END


Test Else If Block
   IF    "${NAME}" == "Rahul"
        log to console    Name is Rahul
   ELSE IF    "${NAME}" == "Cory"
        log to console    Name is Cory
   ELSE
        log to console    Name does not matches
   END

Test Number Comparison
   IF    ${num1} == ${num2}
        log to console    ${num1} matches ${num2}
   ELSE IF    ${num1} < ${num2}
        log to console    ${num1} is less than ${num2}
    ELSE
        log to console    ${num1} is greater than ${num2}
   END

Test OR Conditions

    IF    ${num1} < ${num2} or ${num1} < ${num3}
        log to console    ${num1} is less than ${num2} or less than ${num3}
    ELSE
        log to console    ${num1} is greater than ${num2} and ${num3}
    END

Test AND Conditions

    IF    ${num1} < ${num2} and ${num1} < ${num3}
        log to console    ${num1} is less than ${num2} and less than ${num3}
    ELSE
        log to console    ${num1} is no less than ${num2} or no less than ${num3}
    END