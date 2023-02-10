*** Settings ***
Documentation    API Test to reqres.in for user related enpoint
Library          SeleniumLibrary
Library          RequestsLibrary
Library          JSONLibrary
Library          Collections
Resource         ../../resources/keywords.robot
Resource         ../../resources/variables.robot


*** Test Cases ***
Verify response when register succesfully    
    Create Session
    ...    alias=register
    ...    url=https://reqres.in
    ${body}=
    ...    Create Dictionary
    ...    email=eve.holt@reqres.in
    ...    password=randomer
    ${response}=    
    ...    POST On Session
    ...    alias=register
    ...    url=/api/register
    ...    data=${body}
    ...    expected_status=200
   #  Assertion
    Should Be Equal    ${response.json()}[id]       ${4}
    Should Be Equal    ${response.json()}[token]    QpwL5tke4Pnpja7X4

Verify response register failed
    Create Session
    ...    alias=register
    ...    url=https://reqres.in
    ${body}=
    ...    Create Dictionary
    ...    email=eve.holt@reqres.in
    ${response}=    
    ...    POST On Session
    ...    alias=register
    ...    url=/api/register
    ...    data=${body}
    ...    expected_status=400
   #  Assertion
    Should Be Equal    ${response.json()}[error]       Missing password

Verify response login succesfully
    Create Session
    ...    alias=login
    ...    url=https://reqres.in
    ${body}=
    ...    Create Dictionary
    ...    email=eve.holt@reqres.in
    ...    password=cityslicka
    ${response}=    
    ...    POST On Session
    ...    alias=login
    ...    url=/api/login
    ...    data=${body}
    ...    expected_status=200
   #  Assertion
    Should Be Equal    ${response.json()}[token]    QpwL5tke4Pnpja7X4

Verify response login failed
    Create Session
    ...    alias=login
    ...    url=https://reqres.in
    ${body}=
    ...    Create Dictionary
    ...    email=peter@klaven
    ${response}=    
    ...    POST On Session
    ...    alias=login
    ...    url=/api/login
    ...    data=${body}
    ...    expected_status=400
   #  Assertion
    Should Be Equal    ${response.json()}[error]    Missing password