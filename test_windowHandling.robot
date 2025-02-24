*** Settings ***

Resource    Resources/commons.robot
Variables    Resources/locators.py

*** Variables ***


*** Test Cases ***

Registration form test
    Filling Registration form
    click link    link:ENTER TO THE TESTING WEBSITE
    click element    xpath://*[@id="wrapper"]/div/div/div[5]/ul/li/a/figure
    @{windowHandles}=    get window handles
    log to console    ${windowHandles}
    switch window    ${windowHandles}[1]
    input text    name:name    Rahul
    input text    xpath://*[@id="register_form"]/fieldset[1]/p[2]/input    Arora
    click element    xpath://*[@id="register_form"]/fieldset[2]/div/label[2]/input
    select checkbox    name:hobby
    select from list by label    xpath://*[@id="register_form"]/fieldset[4]/select    India
    select from list by label    xpath://*[@id="register_form"]/fieldset[5]/div[1]/select    1
    select from list by label    xpath://*[@id="register_form"]/fieldset[5]/div[2]/select    1
    select from list by label    xpath://*[@id="register_form"]/fieldset[5]/div[3]/select    2014
    input text    name:phone    1213123213
    input text    name:username    adminuser
    input text    name:email    trainer@way2automation.com
    choose file    xpath://*[@id="register_form"]/fieldset[9]/input    C:\\Users\\way2automation\\Desktop\\project.png



    #close window
    #switch window    ${windowHandles}[0]
    #close window
   # Finish Test Case