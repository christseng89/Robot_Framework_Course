*** Settings ***
Library         SeleniumLibrary
Variables       ../Resources/locators_pom.py
Resource        CarBase.robot


*** Keywords ***
Find Brand Car
    [Arguments]    ${car_xpath}    ${car_heading}
#    Wait Until Element Is Visible    ${car_xpath}    timeout=15s
    Click Element    ${car_xpath}
    verify car heading    ${car_heading}
    sleep    3s

Go to Toyota
    [Arguments]    ${car_heading}
    Find Brand Car    ${toyotacar_xpath}    ${car_heading}

Go to Kia
    [Arguments]    ${car_heading}
    Find Brand Car    ${kiacar_xpath}    ${car_heading}

Go to BMW
    [Arguments]    ${car_heading}
    Find Brand Car    ${bmwcar_xpath}    ${car_heading}

Go to Maruti
    [Arguments]    ${car_heading}
    Find Brand Car    ${maruticar_xpath}    ${car_heading}

Go to Tata
    [Arguments]    ${car_heading}
    Find Brand Car    ${tatacar_xpath}    ${car_heading}

Go to Benz
    [Arguments]    ${car_heading}
    Find Brand Car    ${benzcar_xpath}    ${car_heading}
