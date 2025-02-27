*** Settings ***

Resource    Resources/commons.robot

*** Variables ***
${browser}    chrome

*** Test Cases ***

Basic Test Case
    launching browser  http://google.com    ${browser}
    #input text    id:identifierId       trainer@way2automation.com
    #click element    //*[@id="identifierNext"]/div/button/span
    finish test case

Second Test Case
   launching browser  http://microsoft.com    ${browser}
   # input text    id:identifierId       trainer@way2automation.com
   # click element    //*[@id="identifierNext"]/div/button/span
   finish test case