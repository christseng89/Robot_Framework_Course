*** Settings ***
Resource            Resources/commons.robot

Test Teardown       Ending the test


*** Test Cases ***
Handling Frames
    launching browser    https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_submit_get    chrome
    # maximize browser window

    select frame    xpath://*[@id="iframeResult"]
    # Clicking on 'Try it' button
    click button    xpath:/html/body/button
    sleep    2s

    unselect frame
    @{frames}=    get webelements    xpath://iframe
    ${count}=    get length    ${frames}
    log to console    \nTotal Number of Frames ${count}

    sleep    2s


*** Keywords ***
Ending the test
    close browser
