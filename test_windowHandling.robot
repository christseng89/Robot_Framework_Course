*** Settings ***
Resource    Resources/commons.robot


*** Variables ***
${URL_WAY2AUTO}     https://www.way2automation.com/way2auto_jquery/index.php
${BROWSER}          chrome
${registration}     xpath://*[@id="wrapper"]/div/div/div[5]/ul/li/a/figure


*** Test Cases ***
Registration form test
    Filling Registration form    ${URL_WAY2AUTO}    ${BROWSER}
    click link    link:ENTER TO THE TESTING WEBSITE

#    Search for the registration form
    wait until element is visible    ${registration}    timeout=5s
    click element    ${registration}

#    Switch to the new window for the registration form in the browser
    @{windowHandles}=    get window handles
    ${windowCount}=    Get Length    ${windowHandles}
    Log To Console    Length of Window Handles: ${windowCount}

    switch window    ${windowHandles}[1]
    input text    name:name    Rahul
    input text    xpath://*[@id="register_form"]/fieldset[1]/p[2]/input    Arora

#    Options
    click element    xpath://*[@id="register_form"]/fieldset[2]/div/label[2]/input

#    Checkboxes
    select checkbox    name:hobby
    select checkbox    xpath://*[@id="register_form"]/fieldset[3]/div/label[2]/input

    # Drop down
    select from list by label    xpath://*[@id="register_form"]/fieldset[4]/select    India
    select from list by label    xpath://*[@id="register_form"]/fieldset[5]/div[1]/select    1
    select from list by label    xpath://*[@id="register_form"]/fieldset[5]/div[2]/select    1
    select from list by label    xpath://*[@id="register_form"]/fieldset[5]/div[3]/select    2014
    input text    name:phone    1213123213
    input text    name:username    adminuser
    input text    name:email    trainer@way2automation.com
    choose file
    ...    xpath://*[@id="register_form"]/fieldset[9]/input
    ...    C:/Users/samfi/PycharmProjects/Robot_Framework/project.png

    input text    xpath://*[@id="register_form"]/fieldset[10]/textarea    About yourself...
    input text    name:password    passWord
    input text    name:c_password    passWord

    sleep    2s
    # close window
    # switch window    ${windowHandles}[0]
    # close window

    Finish Test Case
