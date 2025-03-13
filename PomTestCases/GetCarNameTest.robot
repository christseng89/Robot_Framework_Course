*** Settings ***
Resource            ../Resources/commons.robot
Resource            ../PageObjects/CarBase.robot
Resource            ../PageObjects/HomePage.robot
Resource            ../PageObjects/NewCarPage.robot
#Resource            ../PageObjects/ToyotaCarPage.robot
Library             DataDriver    ../Resources/testdata.xlsx    sheet_name=FindNewCarTest

Suite Teardown      Finish Test Case
Test Teardown       Finish Test Case
Test Template       Find New Cars Test


*** Variables ***
${testsiteurl}=     https://www.carwale.com/


*** Test Cases ***
Get Cars Name DD Test '${carheading}'    ${browser}    ${brandname}    ${carheading}


*** Keywords ***
Find New Cars Test
    [Arguments]    ${browser}    ${brandname}    ${carheading}

    launching browser    ${testsiteurl}    ${browser}
    go to new cars page

    IF    '${brandname}' == 'toyota'
        Go to Toyota    ${carheading}
    ELSE IF    '${brandname}' == 'bmw'
        Go to BMW       ${carheading}
    ELSE IF    '${brandname}' == 'kia'
        Go to Kia       ${carheading}
    ELSE IF    '${brandname}' == 'tata'
        Go to Tata      ${carheading}
    ELSE IF    '${brandname}' == 'maruti'
        Go to Maruti    ${carheading}
    ELSE IF    '${brandname}' == 'honda'
        Go to Honda     ${carheading}
    ELSE IF    '${brandname}' == 'benz'
        Go to Benz      ${carheading}
    ELSE
        ${brand_title}=    Evaluate    '${brandname}'.title()
        Fail    Invalid Brand selected: '${brand_title}'
    END

    verify car heading    ${carheading}
    get car name

    Sleep    2s
