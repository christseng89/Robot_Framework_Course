*** Settings ***
Library         SeleniumLibrary
Variables       ../Resources/locators_pom.py


*** Keywords ***
Go to new cars page
    mouse over    ${newcar_xpath}
    click element    ${findnewcar_xpath}
    element text should be    ${newcar_header_xpath}    NEW CARS

 find new cars
    mouse over    ${newcar_xpath}

# find old cars
#    mouse over    ${newcar_xpath}
#
#
# search the page
#    mouse over    ${newcar_xpath}
