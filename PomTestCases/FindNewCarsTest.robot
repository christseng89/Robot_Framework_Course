*** Settings ***
Resource            ../Resources/commons.robot
Resource            ../PageObjects/HomePage.robot
Resource            ../PageObjects/NewCarPage.robot

Test Teardown       Finish Test Case


*** Variables ***
${testsiteurl}=     https://www.carwale.com/
@{CAR_BRANDS}=      Toyota    Kia    BMW    Benz    Tata    Maruti    # List of car brands
${BRAND}=           Toyota    # Default brand to execute


*** Test Cases ***
Find New Cars Test
    launching browser    ${testsiteurl}    chrome
    go to new cars page
    sleep    2s

    Execute Car Brand Navigation

    sleep    1s


*** Keywords ***
Execute Car Brand Navigation
    IF    '${BRAND}' == 'Toyota'    Go to Toyota
    IF    '${BRAND}' == 'Kia'    Go to Kia
    IF    '${BRAND}' == 'BMW'    Go to BMW
    IF    '${BRAND}' == 'Benz'    Go to Benz
    IF    '${BRAND}' == 'Tata'    Go to Tata
    IF    '${BRAND}' == 'Maruti'    Go to Maruti
    IF    '${BRAND}' not in @{CAR_BRANDS}    Fail    Invalid brand: ${BRAND}
