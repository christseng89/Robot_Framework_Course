*** Settings ***

Suite Setup    log to console    create DB Connection
Suite Teardown    log to console    close DB Connection
Test Setup  log to console  Launching Browser
Test Teardown    log to console    Closing Browser


*** Test Cases ***

Login Test
    log to console    Executing Login Test

User reg Test
    log to console    Executing User reg test

Image upload Test
    log to console    Executing Image upload test
