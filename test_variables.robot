*** Settings ***
Library     SeleniumLibrary


**** Keywords ***


*** Variables ***
#Scalar variables - simple variable - Global scope
${value}    100
${secondvalue}    200
${name}    Rahul
${floatvalue}    10.01
${browser}    chrome
${url}=    http://google.com

#List variables - syntax    @{listVariable}=    10    20    Rahul

@{city}=    Delhi    Mumbai    Goa

#Dictionary Variables - Key and Value pair - Syntax - &{dictionary}=    key=value    key=value
${env}=    uat
&{url_dict}=    qa=http://way2automation.com    uat=http://google.com

*** Test Cases ***
Chrome Test Case
    log    ${value}
    log    ${name}
    log    ${floatvalue}
    log    ${browser}
    log    ${url}
    log    ${${value} + ${secondvalue}}
    log    ${name} ${browser} ${floatvalue}
    log    ${city}[0] ${city}[2]
    log    ${url_dict.${env}}
    open browser    ${url_dict.${env}}    ${browser}