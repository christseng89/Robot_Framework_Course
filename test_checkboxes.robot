*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py
Suite Teardown    Ending the test

*** Variables ***

*** Keywords ***
Ending the test
    close browser

*** Test Cases ***

Handling Dropdown list
    launching browser  http://www.tizag.com/htmlT/htmlcheckboxes.php    chrome
    page should contain checkbox    xpath:/html/body/table[3]/tbody/tr[1]/td[2]/table/tbody/tr/td/div[4]/input[1]
    #select checkbox    xpath://div[4]/input[1]
    #select checkbox    xpath://div[4]/input[2]
    #select checkbox    xpath://div[4]/input[3]
    #select checkbox    xpath://div[4]/input[4]

    #unselect checkbox    xpath:/html/body/table[3]/tbody/tr[1]/td[2]/table/tbody/tr/td/div[6]/input[1]
    @{checkboxes}=    get webelements    xpath://td/div[4]//input
    ${count}=    get length    ${checkboxes}
    log to console    Total checkboxes are ${count}

    FOR    ${checkbox}    IN    @{checkboxes}
        select checkbox    ${checkbox}
    END

    unselect checkbox    xpath://div[4]/input[4]

    checkbox should be selected    xpath://div[4]/input[4]

