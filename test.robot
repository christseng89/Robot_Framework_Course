*** Variables ***
${NAME}=    Rahula
${num1}=    10
${num2}=    20

*** Test Cases ***
Test If Block
# If Block
    IF    "${NAME}" == "Rahul"
        Log To Console    Name is Rahul
    ELSE
        Log To Console    Name is not Rahul
    END
