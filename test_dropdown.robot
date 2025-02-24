*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py

*** Variables ***


*** Test Cases ***

Handling Dropdown list
    launching browser  https://www.wikipedia.org/    chrome
    #select from list by label    name:language    Eesti
    #select from list by index    name:language    2
    select from list by value   name:language    hi
    @{elements}=    get webelements    xpath://select[@id='searchLanguage']//option
    ${count}=    get length    ${elements}
    log to console    Total values are ${count}
    FOR    ${element}    IN    @{elements}
        #${text}=    get text    ${element}
        ${text}=    get element attribute    ${element}    lang
        log to console    ${text}
    END

Handling Links
    @{links}=    get webelements    xpath://a
    ${linkcount}=    get length    ${links}
    log to console    Total links are ${linkcount}
    @{childelements}=    get webelements    xpath://*[@id="www-wikipedia-org"]/div[7]/div[3]//a
    ${childlinkscount}=    get length    ${childelements}
    log to console    Total links in the section are: ${childlinkscount}
     FOR    ${link}    IN    @{childelements}
        #${text}=    get text    ${link}
        ${text}=    get element attribute    ${link}    href
        log to console    ${text}
    END