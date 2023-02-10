*** Settings ***
Documentation    API Test to reqres.in for user related enpoint
Library          SeleniumLibrary
Library          RequestsLibrary
Library          JSONLibrary
Library          Collections
Resource         ../../resources/keywords.robot
Resource         ../../resources/variables.robot


*** Test Cases ***
Verify get list users page 1 respones key
    Create Session
    ...    alias=getUser
    ...    url=https://reqres.in
    ${response}=    
    ...    GET On Session
    ...    alias=getUser
    ...    url=/api/users?page=1
    ...    expected_status=200
   #  Assertion
   Dictionary Should Contain Key    ${response.json()}    page
   Dictionary Should Contain Key    ${response.json()}    per_page
   Dictionary Should Contain Key    ${response.json()}    total
   Dictionary Should Contain Key    ${response.json()}    total_page
   Dictionary Should Contain Key    ${response.json()}    data

Verify get list users page 1 response value
    Create Session
    ...    alias=getUser
    ...    url=https://reqres.in
    ${response}=    
    ...    GET On Session
    ...    alias=getUser
    ...    url=/api/users?page=1
    ...    expected_status=200
   #  Assertion
   Should Be Equal    ${response.json()}[page]           ${1}
   Should Be Equal    ${response.json()}[per_page]       ${6}
   Should Be Equal    ${response.json()}[total]          ${12}
   Should Be Equal    ${response.json()}[total_pages]    ${2}
   Length Should Be   ${response.json()}[data]           ${6}

Verify list user data in page 1
    Create Session
    ...    alias=getUser
    ...    url=https://reqres.in
    ${response}=    
    ...    GET On Session
    ...    alias=getUser
    ...    url=/api/users?page=1
    ...    expected_status=200
    ${data}=
    ...    Load JSON From File
    ...    ${CURDIR}/../../resources/reqres-user-data-1.json
   #  Assertion
   Should Be Equal    ${data}    ${response.json()}[data]

Verify list user data in page 2
    Create Session
    ...    alias=getUser
    ...    url=https://reqres.in
    ${response}=    
    ...    GET On Session
    ...    alias=getUser
    ...    url=/api/users?page=2
    ...    expected_status=200
    ${data}=
    ...    Load JSON From File
    ...    ${CURDIR}/../../resources/reqres-user-data-2.json
   #  Assertion
   Should Be Equal    ${data}    ${response.json()}[data]

Verify single user data with id 2
    Create Session
    ...    alias=getUser
    ...    url=https://reqres.in
    ${response}=    
    ...    GET On Session
    ...    alias=getUser
    ...    url=/api/users/2
    ...    expected_status=200
    ${data}=
    ...    Create Dictionary
    ...    id=${2}
    ...    email=janet.weaver@reqres.in
    ...    first_name=Janet
    ...    last_name=Weaver
    ...    avatar=https://reqres.in/img/faces/2-image.jpg
   #  Assertion
   Should Be Equal    ${data}    ${response.json()}[data]

Verify response of single user not found
    Create Session
    ...    alias=getUser
    ...    url=https://reqres.in
    ${response}=    
    ...    GET On Session
    ...    alias=getUser
    ...    url=/api/users/2223
    ...    expected_status=404

Verify response of create a new user
    Create Session
    ...    alias=postUser
    ...    url=https://reqres.in
    ${param}
    ...    Create Dictionary
    ...    name=Michael
    ...    job=Tech Assistant
    ${response}=    
    ...    POST On Session
    ...    alias=postUser
    ...    url=/api/users
    ...    data=${param}
    ...    expected_status=201
   #  Assertion
   Should Be Equal    ${response.json()}[name]    Michael
   Should Be Equal    ${response.json()}[job]     Tech Assistant

Verify response of update a user
    Create Session
    ...    alias=putUser
    ...    url=https://reqres.in
    ${param}
    ...    Create Dictionary
    ...    name=Angelo
    ...    job=Tech Lead
    ${response}=    
    ...    PUT On Session
    ...    alias=putUser
    ...    url=/api/users/2
    ...    data=${param}
    ...    expected_status=200
   #  Assertion
   Should Be Equal    ${response.json()}[name]    Angelo
   Should Be Equal    ${response.json()}[job]     Tech Lead

Verify response of delete a user
    Create Session
    ...    alias=deleteUser
    ...    url=https://reqres.in
    ${response}=    
    ...    DELETE On Session
    ...    alias=deleteUser
    ...    url=/api/users/2
    ...    expected_status=204