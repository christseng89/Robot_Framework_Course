*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/locators.py


*** Keywords ***
verify kia car heading
    [Arguments]    ${carheading}
    element text should be    ${carheading_xpath}    ${carheading}