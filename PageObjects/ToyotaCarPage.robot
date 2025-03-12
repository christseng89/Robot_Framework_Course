*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/locators_pom.py


*** Keywords ***
verify toyota car heading
    [Arguments]    ${carheading}
    element text should be    ${carheading_xpath}    ${carheading}