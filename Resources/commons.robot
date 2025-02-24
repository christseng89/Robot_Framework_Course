*** Settings ***
Library     SeleniumLibrary
Library    AllureLibrary


*** Keywords ***
launching browser
    [Arguments]    ${url}    ${browserName}
    open browser    ${url}    ${browserName}
    set selenium implicit wait    10 seconds
    log title





#Filling Registration form
#    launching browser  https://www.way2automation.com/way2auto_jquery/index.php    chrome
#    maximize browser window
#    input text    ${name}    Rahul Arora
#    input text    ${phone}    8923848274
#
#    ${random}=    evaluate    random.randint(5000,999999)
#    ${emailnew}=    catenate    ${random}    __2_ @way2automation.com
#    ${email_id}=    evaluate    '${emailnew}'.replace(' ','_')
#
#    input text    ${email}    ${email_id}
#    select from list by label    ${country}    Iceland
#    input text    ${city}    Delhi
#    input text    ${username}    rahularora1423
#    input text    ${password}    askjdbfskjdfs
#    click button    ${submitBtn}


Finish Test Case
    log    Ending the test case
    close browser