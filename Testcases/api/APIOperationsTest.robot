*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${BASE_URL}                             https://dummyjson.com
${HEADERS}                              {"Content-Type": "application/json"}
${CREATED_USER_ID}                      NONE
${Test_Data_Add_User}                   adduser.json
${Test_Data_Update_User}                updateuser.json
${ADD_USER_JSON}                        ${CURDIR}${/}..${/}..${/}Testdata${/}api${/}${Test_Data_Add_User}
${UPDATE_USER_JSON}                     ${CURDIR}${/}..${/}..${/}Testdata${/}api${/}${Test_Data_Update_User}

*** Test Cases ***

GET All Users
    [Documentation]    Fetch all users
    Create Session    apiSession    ${BASE_URL}
    ${response}=      GET On Session    apiSession    /users
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

GET User By ID
    [Documentation]    Get a single user by ID
    Create Session    apiSession    ${BASE_URL}
    ${response}=      GET On Session    apiSession    /users/1
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    firstName
    Log To Console    ${response.json()}

CREATE User (POST)
    [Documentation]    Create a new user
    ${headers}=        Create Dictionary    Content-Type=application/json
    Create Session     apiSession    ${BASE_URL}    headers=${headers}
    #${payload}=        Create Dictionary    firstName=Niraj    lastName=Automation    age=30
    ${payload}=    load json from file    ${ADD_USER_JSON}
    ${response}=       POST On Session    apiSession    /users/add    json=${payload}
    Should Be Equal As Strings    ${response.status_code}    201
    ${created_user}=   Set Variable    ${response.json()}
    #Set Suite Variable    ${CREATED_USER_ID}    ${created_user['id']}
    set Suite variable    ${CREATED_USER_ID}    ${created_user['id']}
    Log To Console     Created User ID: ${CREATED_USER_ID}

UPDATE User (PUT)
    [Documentation]    Update the user created in POST step
    Log To Console    Created ID: ${CREATED_USER_ID}
    Should Not Be Equal As Integers    ${CREATED_USER_ID}    0
    ${headers}=        Create Dictionary    Content-Type=application/json
    Create Session     apiSession    ${BASE_URL}    headers=${headers}
    #Should Not Be Empty    ${CREATED_USER_ID}
    #${updated_payload}=    Create Dictionary    firstName=NirajUpdated    lastName=QAEngineer
    ${updated_payload}=    load json from file    ${UPDATE_USER_JSON}
    #${response}=       PUT On Session    dummy    /users/${CREATED_USER_ID}    json=${updated_payload}
    ${response}=       PUT On Session    apiSession    /users/2    json=${updated_payload}
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console     ${response.json()}

DELETE User
    [Documentation]    Delete the user created above
    Log To Console    Created ID: ${CREATED_USER_ID}
    Should Not Be Equal As Integers    ${CREATED_USER_ID}    0
    ${headers}=        Create Dictionary    Content-Type=application/json
    Create Session     apiSession    ${BASE_URL}    headers=${headers}
    #${response}=       DELETE On Session    dummy    /users/${CREATED_USER_ID}
    ${response}=       DELETE On Session    apiSession    /users/1
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console     ${response.json()}
