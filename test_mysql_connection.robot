*** Settings ***
Library     DatabaseLibrary
Resource    config.robot    # Import credentials and settings


*** Variables ***
${DB_HOST}          ${MYSQL_HOST}
${DB_PORT}          ${MYSQL_PORT}
${DB_NAME}          ${MYSQL_NAME}
${DB_TABLE}         ${MYSQL_TABLE}
${DB_USER}          ${MYSQL_USER}
${DB_PASSWORD}      ${MYSQL_PASSWORD}
${DB_TABLE_ID}      ${MYSQL_TABLE_ID}


*** Test Cases ***
Connect To MySQL And Run Query
    [Documentation]    This test connects to MySQL, runs a query, and verifies results.
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    ${result}=    Query    SELECT ${DB_TABLE_ID} FROM ${DB_TABLE}
    Log to console   \nResult: ${result}
    Should Not Be Empty    ${result}
    Disconnect From Database
