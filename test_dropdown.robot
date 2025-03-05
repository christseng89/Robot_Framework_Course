*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py

*** Variables ***
${LANG}    zh
${LANG_INDEX}   70
${LANG_LABEL}    English

*** Test Cases ***

Handling Dropdown list
    launching browser  https://www.wikipedia.org/    chrome
    maximize browser window

#    select from list by value   name:language    ${LANG}
##    select from list by index   name:language    ${LANG_INDEX}

    # List by Label and using ${LANG_LABEL} to get ${LANG}
    select from list by label   name:language    ${LANG_LABEL}
    ${selected_option}=    Get WebElement    xpath://select[@id='searchLanguage']/option[normalize-space(.)='${LANG_LABEL}']
    ${LANG}=    Get Element Attribute    ${selected_option}    lang
    log to console    Selected language code: ${LANG}

    @{elements}=    get webelements    xpath://select[@id='searchLanguage']//option
    ${count}=    get length    ${elements}
    log to console    Total languages are ${count}

    ${position}=    Set Variable    0
    FOR    ${element}    IN    @{elements}
        ${text}=    get element attribute    ${element}    lang
        IF   '${text}' == '${LANG}'
            log to console    '${text}' language found at position ${position}.
            exit for loop
        ELSE
            ${position}=    evaluate    ${position}+1
        END
    END

    log to console  \n

    sleep   10s

#Handling Links
#    @{links}=    get webelements    xpath://a
#    ${linkcount}=    get length    ${links}
##    log to console    1st link is ${links}[0]
#    log to console    Total number of links are: ${linkcount}
#
#    @{childelements}=    get webelements    xpath://*[@id="www-wikipedia-org"]/div[7]/div[3]//a
#    ${childlinkscount}=    get length    ${childelements}
#    log to console    Total number of child links are: ${childlinkscount}
#
#    FOR    ${link}    IN    @{childelements}
#        #${text}=    get text    ${link}
#        ${text}=    get element attribute    ${link}    href
#        log to console    Link is ${text}
#    END
#
#    sleep   10s