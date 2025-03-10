*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/commons.robot

*** Keywords ***
verify car heading
    [Arguments]    ${carheading}
    element text should be    ${carheading_xpath}    ${carheading}

get car name
    @{carnames}=    get webelements    ${carnames_xpath}

    FOR    ${carname}    IN    @{carnames}

        ${text}=    get text    ${carname}

        log to console    ${text}
    END