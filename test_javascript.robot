*** Settings ***
Resource            Resources/commons.robot

Test Teardown       Ending the test


*** Variables ***
${WEB_ELEMENT}=     xpath:/html/body/button


*** Test Cases ***
Handling Dropdown list
    launching browser    https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_submit_get    chrome
#    headlesschrome

    select frame    xpath://*[@id="iframeResult"]
#    # First Test by using Hardcode myFunction()
#    click button    ${WEB_ELEMENT}
#    execute javascript    myFunction()
#    sleep    3s

    # Second Test by using get webelement
    ${element}=    get webelement    ${WEB_ELEMENT}
    execute javascript    arguments[0].style.border='3px solid red'    ARGUMENTS    ${element}
    execute javascript    arguments[0].click();    ARGUMENTS    ${element}
    # capture element screenshot    ${element}    selenium-element-screenshot-{index}.png
    capture element screenshot    ${element}    EMBED
    unselect frame
    capture page screenshot    fullpage.png
    capture page screenshot    EMBED
    sleep    3s


*** Keywords ***
Ending the test
    close browser
