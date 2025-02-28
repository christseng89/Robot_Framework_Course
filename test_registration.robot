*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py

*** Variables ***
${URL_WAY2AUTO}    https://www.way2automation.com/way2auto_jquery/index.php
${BROWSER}    chrome

*** Keywords ***
Filling Registration form
    launching browser   ${URL_WAY2AUTO}  ${BROWSER}
    maximize browser window

    input text    ${name}    Rahul Arora
    input text    ${phone}    8923848274

    # Generating random numbers and concatenation for email id
    ${random}=    evaluate    random.randint(5000,999999)
    ${email_random}=    catenate    ${random}    _2_ @way2automation.com
    ${email_id}=    evaluate    '${email_random}'.replace(' ','_')

    input text    ${email}    ${email_id}
    Log    ${email_id}

    select from list by label    ${country}    Iceland
    input text    ${city}    Delhi
    input text    ${username}    rahularora1423
    input text    ${password}    askjdbfskjdfs
    click button    ${submitBtn}
    sleep    5s


*** Test Cases ***

Registration form test
    Filling Registration form
    Finish Test Case
