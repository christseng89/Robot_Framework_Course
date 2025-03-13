*** Settings ***
Library         SeleniumLibrary
Variables       locators.py
Variables       locators_pom.py


*** Keywords ***
launching browser
    [Arguments]    ${url}    ${browser}

    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-blink-features\=AutomationControlled
    Call Method    ${chrome_options}    add_argument    --start-maximized

    IF    '${browser}' == 'chrome'
        Open Browser    ${url}    ${browser}    options=${chrome_options}
    ELSE IF    '${browser}' == 'firefox'
        open browser    ${url}    ${browser}
    END

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
