*** Settings ***

Resource    Resources/commons.robot

Test Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Mouse over menus
    launching browser    https://www.way2automation.com/    chrome    options=${MOUSE_OPTION}
    # Mouse Over -> All Courses
    mouse over    xpath://*[@id="menu-item-27580"]/a/span[2]
    click link    Lifetime Membership
#    sleep    3s

    ${text}=    get text    xpath://*[@id="post-25580"]/div/div/section[1]/div[2]/div/div/div/div/h1
    log to console    \nLifetime Text: ${text}

    sleep    5s