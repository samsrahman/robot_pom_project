*** Settings ***
Resource    ../resources/keywords/LoginPageStep.robot
Resource    ../common/CommonKeywords.robot
Test Setup    Open Application
Test Teardown    Teardown Actions


*** Test Cases ***
Login Scenario - Valid Credentials
    [Tags]    regression    smoke  valid   desktop
    [Documentation]    Verify user can log in with valid credentials
    Given User is on the Login Page
    When User logs in using valid credentials
    Then Login should be successful

Login Scenario - Invalid Username
    [Tags]    regression  invalid  mobileWeb
    [Documentation]    Verify error message when user logs in with invalid username
    Given User is on the Login Page
    When User logs in with invalid username
    Then Error message should be displayed
    And Error message text should be

