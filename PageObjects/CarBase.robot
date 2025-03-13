*** Comments ***
# Brand Car Page


*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/commons.robot


*** Keywords ***
verify car heading
    [Arguments]    ${carheading}
    wait until page contains element    ${carheading_xpath}    timeout=2s
    element text should be    ${carheading_xpath}    ${carheading}
    log to console    \nBrand Car heading verified '${carheading}'

get car name
    @{carnames}=    get webelements    ${carnames_xpath}

    FOR    ${carname}    IN    @{carnames}
        ${text}=    get text    ${carname}

        log to console    ${text}
    END
