*** Settings ***
Documentation     Step definitions for Login feature test cases.
Resource          ../actions/LoginPageActions.robot
Resource          ../../resources/keywords/LoginPageStep.robot
Resource          ../../common/CommonKeywords.robot

*** Keywords ***
User is on the Login Page
    Log To Console    Navigated to Login Page

User logs in using valid credentials
    ${username}    ${password}=    Read Valid Credentials
    Login With Credentials    ${username}    ${password}

Login should be successful
    Verify Login Successful

User logs in with invalid username
    ${username}    ${password}=    Read InValid Credentials
    Login With Credentials    ${username}    ${password}

Error message should be displayed
    Verify Login Error Message

Error message text should be
    Verify Error Message Text
