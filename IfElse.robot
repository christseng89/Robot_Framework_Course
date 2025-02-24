*** Variables ***
${NAME}=    Rahula
${num1}=    10
${num2}=    20
*** Test Cases ***
#If Block
#    IF    "${NAME}" == "Rahul"
#          log to console    Name is Rahul
#    ELSE
#           log to console    Name is not Rahul
#    END

#Else If Block
#    IF    "${NAME}" == "Rahul"
#          log to console    Name is Rahul
#    ELSE IF    "${NAME}" == "Cory"
#           log to console    Name is Cory
#    ELSE
#           log to console    Name does not matches
#    END

#Number Comparison
#    IF    ${num1} == ${num2}
#        log to console    Number Matches
#    ELSE IF    ${num1} < ${num2}
#        log to console    ${num1} is less than ${num2}
#    END

OR AND Conditions

    IF    ${num1} < ${num2} or ${num1} < 9
        log to console    ${num1} is less than ${num2} or less than 9
    END