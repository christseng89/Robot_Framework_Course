*** Comments ***
# Home Page -> Find New Cars -> New Cars Page -> Brand Car Page (CarBase.robot)


*** Settings ***
Library         SeleniumLibrary
Variables       ../Resources/locators_pom.py


*** Keywords ***
Go to new cars page
    # Home Page
    click element    ${newcar_xpath}
    # log to console    \n'New Cars' clicked

    wait until page contains element    ${newcar_header_xpath}    timeout=2s
    click element    ${findnewcar_xpath}
    # log to console    'Find New Cars' clicked
    
    # New Cars Page
    wait until page contains element    ${newcar_header_xpath}    timeout=2s
    element should contain    ${newcar_header_xpath}    NEW CARS
    # log to console    'New Cars' page loaded

# find new cars

# find old cars

# search the page
