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
    Find Brand Car    ${toyotacar_xpath}    Toyota Cars

Go to Kia
    Find Brand Car    ${kiacar_xpath}    Kia Cars

Go to BMW
    Find Brand Car    ${bmwcar_xpath}    BMW Cars

Go to Maruti
    Find Brand Car    ${maruticar_xpath}    Maruti Cars

Go to Tata
    Find Brand Car    ${tatacar_xpath}    Tata Cars

Go to Benz
    Find Brand Car    ${benzcar_xpath}    Mercedes-Benz Cars
