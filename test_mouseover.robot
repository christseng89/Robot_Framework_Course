*** Settings ***
Resource            Resources/commons.robot

Test Teardown       Ending the test


*** Variables ***
${LIFETIME_TEXT}    xpath://*[@id="post-25580"]/div/div/section[1]/div[2]/div/div/div/div/h1


*** Test Cases ***
Handling Mouse over menus
    launching browser    https://www.way2automation.com/    chrome
    # Mouse Over -> All Courses
    mouse over    xpath://*[@id="menu-item-27580"]/a/span[2]
    click link    Lifetime Membership

    Wait Until Element Is Visible    ${LIFETIME_TEXT}    timeout=3s
    ${text}=    get text    ${LIFETIME_TEXT}
    log to console    \nLifetime Text: ${text}

    sleep    2s


*** Keywords ***
Ending the test
    close browser
