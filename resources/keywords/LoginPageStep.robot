*** Settings ***
Documentation     Contains all low-level reusable actions for the Login page.
Resource          ../locators/LoginLocators.robot
Resource           ../../common/CommonKeywords.robot

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Sleep    1s
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Verify Login Successful
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    10s
    Element Should Contain    ${SUCCESS_MESSAGE}    Log out
    Log To Console    Login Successful

Verify Login Error Message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    10s
    Log To Console    Error message displayed on screen

Verify Error Message Text
    Element Text Should Be    ${ERROR_MESSAGE}    Your username is inval
    Log To Console    Correct error message verified

User is on the Login Page
    Log To Console    Navigated to Login Page

User logs in using valid credentials
    ${username}    ${password}=    Read Valid Credentials
    Login With Credentials    ${username}    ${password}

Login should be successful
    Verify Login Successful

Error message should be displayed
    Verify Login Error Message

User logs in with invalid username
     ${username}    ${password}=    Read InValid Credentials
     Login With Credentials    ${username}    ${password}

Error message text should be
    Verify Error Message Text