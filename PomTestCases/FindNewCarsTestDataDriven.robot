*** Settings ***
Resource            ../Resources/commons.robot
Resource            ../PageObjects/HomePage.robot
Resource            ../PageObjects/NewCarPage.robot
# Data Driven Test
Library             DataDriver    ../Resources/testdata.xlsx    sheet_name=FindNewCarTest

Suite Teardown      Finish Test Case
Test Teardown       Finish Test Case
Test Template       Find New Cars Test   # Ensure this matches the keyword name


*** Variables ***
${TestSiteUrl}=     https://www.carwale.com/
@{CAR_BRANDS}=      Toyota    Kia    Bmw    Benz    Tata    Maruti  Honda
${BRAND}=           Toyota    # Default brand to execute


*** Test Cases ***
Find New Cars DD Test '${carheading}'    ${browser}    ${brandname}    ${carheading}


*** Keywords ***
Find New Cars Test
    [Arguments]    ${browser}    ${brandname}    ${carheading}
    launching browser    ${TestSiteUrl}    ${browser}
    go to new cars page
#    sleep    1s

    ${brand}=    Evaluate    '${brandname}'.title()    # Capitalize brand name once

    IF    '${brand}' == 'Toyota'    Go to Toyota    ${carheading}
    IF    '${brand}' == 'Kia'    Go to Kia    ${carheading}
    IF    '${brand}' == 'Bmw'    Go to BMW    ${carheading}
    IF    '${brand}' == 'Benz'    Go to Benz    ${carheading}
    IF    '${brand}' == 'Tata'    Go to Tata    ${carheading}
    IF    '${brand}' == 'Maruti'    Go to Maruti    ${carheading}
    IF    '${brand}' == 'Honda'    Go to Honda    ${carheading}

    IF    '${brand}' not in @{CAR_BRANDS}    Fail    Invalid brand: ${brand}

    sleep    1s
