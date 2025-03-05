*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py

*** Variables ***
${LANG}          en
${LANG_INDEX}    12
${LANG_LABEL}    English
${LANG_URL}      https://${LANG}.wikipedia.org

*** Test Cases ***

Handling Dropdown list
    launching browser  https://www.wikipedia.org/    chrome
    maximize browser window

    ### Method 1: Select From List By Value
    select from list by value   name:language    ${LANG}

#    ### Method 2: Select From List By Index and using ${LANG_INDEX} to get ${LANG}
#    select from list by index   name:language    ${LANG_INDEX}
#    ${LANG}=    Get Element Attribute    xpath://select[@id='searchLanguage']/option[${LANG_INDEX}+1]    lang
#    log to console    Selected language code: ${LANG}

#    ### Method 3: Select From List By Label and using ${LANG_LABEL} to get ${LANG}
#    select from list by label   name:language    ${LANG_LABEL}
#    ${selected_option}=    Get WebElement    xpath://select[@id='searchLanguage']/option[normalize-space(.)='${LANG_LABEL}']
#    ${LANG}=    Get Element Attribute    ${selected_option}    lang
#    log to console    Selected language code: ${LANG}

    @{elements}=    get webelements    //option
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
    sleep   2s

Handling Links
    @{childelements}=    get webelements    xpath=//div[contains(@class,'langlist')]//a
    ${childlinkscount}=    get length    ${childelements}
    log to console    Total number of child language links are: ${childlinkscount}

    ${url_link}=    Set Variable    None

    FOR    ${link}    IN    @{childelements}
        ${href}=    get element attribute    ${link}    href
        ${text}=    get text    ${link}

#        log to console    Checking link: ${href}

        IF    '${LANG}.' in '${href}'
            log to console    Found language link: ${text} - ${href}
            ${url_link}=    Set Variable    ${href}
            exit for loop
        END
    END

    log to console    Final selected URL link: ${url_link}

    # Optional: You can directly navigate to the found link
    log to console    Navigated to ${url_link}.
    go to    ${url_link}
    Wait Until Element Is Visible   xpath:/html/body/div[1]/header/div[1]/a/img     5s

    sleep   5s

