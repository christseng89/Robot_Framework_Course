*** Settings ***

Resource    Resources/commons.robot

*** Variables ***


*** Test Cases ***

Basic Test Case
    launching browser  http://gmail.com    chrome
    #input text    id:identifierId       trainer@way2automation.com
    #click element    //*[@id="identifierNext"]/div/button/span


Second Test Case
    launching browser  http://google.com    firefox
   # input text    id:identifierId       trainer@way2automation.com
   # click element    //*[@id="identifierNext"]/div/button/span