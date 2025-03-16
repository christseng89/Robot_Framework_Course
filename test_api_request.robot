*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_URL}=    http://localhost:8080/api/users


*** Test Cases ***
Sending GET Request
    ${resp}=    GET    ${base_URL}    expected_status=200
    log to console    \nUrl: ${base_URL}, status code: ${resp.status_code}
    status should be    OK    ${resp}

Sending GET Request and Resposne Data
    ${resp}=    GET    ${base_URL}    expected_status=200
    ${record_count}=    Get Length    ${resp.json()}
    ${pretty_json}=    Evaluate    json.dumps(${resp.json()}[0], indent=4)    json
    log to console
    ...    \nUrl: ${base_URL}, No. of records: ${record_count}, status code: ${resp.status_code}, \nresponse Json[0]:\n${pretty_json}\n

Creating session and Sending GET Request
    create session    userdetails    ${base_URL}
    ${resp}=    GET On Session    userdetails    ${base_URL}
    # log to console    ${resp.json()}
    ${pretty_json}=    Evaluate    json.dumps(${resp.json()}[1], indent=4)    json
    log to console
    ...    \nUrl: ${base_URL}, status code: ${resp.status_code}, \nresponse Json[1]:\n${pretty_json}\n \nfirstName: ${resp.json()[1]['firstName']}, email: ${resp.json()[1]['email']}
    should be equal    ${resp.json()[1]['email']}    raman@way2automation.com

Creating session and Sending POST Request
    ${body}=    Create Dictionary    email=anyuser@newuser.com    firstName=Any    lastName=User
    Create Session    userdetails    ${base_URL}

    ${resp}=    POST On Session    userdetails    /    json=${body}
    log to console    \nPOST Response Status: ${resp.status_code}

    # Check if response body is not empty
    IF    '${resp.content}' != '' and '${resp.status_code}' == '201'
        log to console    \nResponse JSON: ${resp.json()}
    ELSE
        log to console    \nResponse body is empty or not a valid JSON.
    END

    ${resp}=    GET    ${base_URL}    expected_status=200
    ${pretty_json}=    Evaluate    json.dumps(${resp.json()}[-1], indent=4)    json
    log to console    Created User: \n${pretty_json}\n
    ${last_user_id}=    Set Variable    ${resp.json()[-1]['id']}
    log to console    \nCreated User Id: ${last_user_id}
    Set Global Variable    ${last_user_id}

Creating session and Sending DELETE Request
    create session    userdetails    ${base_URL}
    ${resp}=    DELETE On Session    userdetails    ${base_URL}/${last_user_id}    expected_status=200
    log to console    \nDeleted User id: ${last_user_id}, response: ${resp.status_code}
