*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/locators.py

*** Keywords ***
Go to new cars page
    mouse over    ${newcar_xpath}
    click element    ${findnewcar_xpath}
    element text should be    ${newcar_header_xpath}    New Cars

find new cars


find old cars


search the page