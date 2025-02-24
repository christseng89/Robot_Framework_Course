*** Settings ***

Resource    ../PageObjects/CarBase.robot
Resource    ../PageObjects/HomePage.robot
Resource    ../Resources/commons.robot
Resource    ../PageObjects/NewCarPage.robot
Resource    ../PageObjects/ToyotaCarPage.robot






Test Teardown    Finish Test Case

*** Variables ***
${testsiteurl}=    https://www.carwale.com/


*** Test Cases ***
Find New Cars Test
    launching browser    ${testsiteurl}    chrome
    go to new cars page
    #Go to Toyota
    #verify toyota car heading    Toyota Cars1
    #Go to Kia
    #verify car heading    Kia Cars
    Go to BMW
    verify car heading    BMW Cars


    sleep    2s
