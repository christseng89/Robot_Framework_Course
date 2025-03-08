*** Settings ***
Resource            Resources/commons.robot

### End with TearDown
Suite Teardown      Ending the test


*** Variables ***
${XPATH_CHECKBOX}       xpath://div[4]//input


*** Test Cases ***
Handling Dropdown list
    launching browser    http://www.tizag.com/htmlT/htmlcheckboxes.php    chrome
    # maximize browser window

    page should contain checkbox    xpath:/html/body/table[3]/tbody/tr[1]/td[2]/table/tbody/tr/td/div[4]/input[1]
#    select checkbox    xpath://div[4]/input[1]
#    select checkbox    xpath://div[4]/input[2]
#    select checkbox    xpath://div[4]/input[3]
#    select checkbox    xpath://div[4]/input[4]

    @{checkboxes}=    get webelements    ${XPATH_CHECKBOX}
    ${count}=    get length    ${checkboxes}
    log to console    Total checkboxes are ${count}

    FOR    ${checkbox}    IN    @{checkboxes}
        select checkbox    ${checkbox}
        sleep    1s
    END

    unselect checkbox    ${checkboxes}[3]
    checkbox should not be selected    ${checkboxes}[3]
    checkbox should be selected    ${checkboxes}[2]

    sleep    3s


*** Keywords ***
Ending the test
    close browser
