*** Settings ***
Resource            ../Resources/commons.robot
Resource            ../PageObjects/CarBase.robot
Resource            ../PageObjects/HomePage.robot
Resource            ../PageObjects/NewCarPage.robot
Resource            ../PageObjects/ToyotaCarPage.robot
Library             DataDriver    ../Resources/testdata.xlsx    sheet_name=FindNewCarTest

Test Teardown       Finish Test Case
Test Template       Find New Cars


*** Variables ***
${testsiteurl}=     https://www.carwale.com/


*** Test Cases ***
Find New Cars Test ${brandname}    ${browser}    ${brandname}    ${carheading}


*** Keywords ***
Find New Cars
    [Arguments]    ${browser}    ${brandname}    ${carheading}
    launching browser    ${testsiteurl}    ${browser}
    go to new cars page
    IF    "${brandname}" == "toyota"
        Go to Toyota
    ELSE IF    "${brandname}" == "bmw"
        Go to BMW
    ELSE IF    "${brandname}" == "kia"
        Go to Kia
    ELSE
        log to console    Invalid car selected
    END
    verify car heading    ${carheading}

    sleep    2s
