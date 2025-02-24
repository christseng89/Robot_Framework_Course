*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/locators.py

*** Keywords ***
Go to Toyota
    click element    ${toyotacar_xpath}

Go to Kia
    click element    ${kiacar_xpath}

Go to BMW
    click element    ${bmwcar_xpath}

Go to Maruti
    click element    ${maruticar_xpath}

Go to Tata
    click element    ${tatacar_xpath}