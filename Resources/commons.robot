*** Settings ***
Library         SeleniumLibrary
Variables       locators.py
Variables       locators_pom.py
# Library    AllureLibrary


*** Variables ***
${OPTIONS}      add_experimental_option("excludeSwitches", ["enable-logging"])


*** Keywords ***
launching browser
    [Arguments]    ${url}    ${browser}    ${options}=${OPTIONS}
    open browser    ${url}    ${browser}    options=${options}

    maximize browser window
    set selenium implicit wait    10 seconds
    log title

Filling Registration form
    [Arguments]    ${url_way2auto}    ${browser}
    launching browser    ${url_way2auto}    ${browser}
    maximize browser window

    input text    ${name}    Rahul Arora
    input text    ${phone}    8923848274

    # Generating random numbers and concatenation for email id
    ${random}=    evaluate    random.randint(5000,999999)
    ${email_random}=    catenate    ${random}    _2_ @way2automation.com
    ${email_id}=    evaluate    '${email_random}'.replace(' ','_')

    input text    ${email}    ${email_id}
    log    ${email_id}

    select from list by label    ${country}    Iceland
    input text    ${city}    Delhi
    input text    ${username}    rahularora1423
    input text    ${password}    askjdbfskjdfs
    click button    ${submitBtn}
    sleep    2s

Finish Test Case
    log    Ending the test case
    close browser
