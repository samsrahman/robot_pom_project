*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    AllureLibrary
Resource   BrowserConfig.robot
*** Variables ***
${JSON_FILE}  ${CURDIR}/../resources/testdata/data.json

*** Keywords ***
Open Application
    Run Keyword If    '${RUN_MODE}' == 'mobile'    Open Mobile Browser
    ...    ELSE    Open Desktop Browser

Open Desktop Browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Log To Console    Running in Desktop Mode

Open Mobile Browser
    ${mobile_emulation}=    Create Dictionary    deviceName=iPhone X
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_experimental_option    mobileEmulation    ${mobile_emulation}
    Create WebDriver    Chrome    options=${chrome_options}
    Go To    ${BASE_URL}
    Log To Console    Running in Mobile Emulation Mode

Close Application
    Close Browser

Read Valid Credentials
    ${data}=    Load JSON From File    ${JSON_FILE}
    ${username}=    Get Value From Json    ${data}    $.credValid.username
    ${password}=    Get Value From Json    ${data}    $.credValid.password
    ${username}=    Set Variable    ${username[0]}
    ${password}=    Set Variable    ${password[0]}
    [Return]    ${username}    ${password}

Read Invalid Credentials
    ${data}=    Load JSON From File    ${JSON_FILE}
    ${username}=    Get Value From Json    ${data}    $.credInValid.username
    ${password}=    Get Value From Json    ${data}    $.credInValid.password
    ${username}=    Set Variable    ${username[0]}
    ${password}=    Set Variable    ${password[0]}
    [Return]    ${username}    ${password}

*** Keywords ***
Capture Screenshot And Attach To Allure
    [Arguments]    ${name}=failure_screenshot
    ${screenshot_dir}=    Set Variable    ${OUTPUT DIR}${/}screenshots
    Run Keyword And Ignore Error    Create Directory    ${screenshot_dir}
    ${path}=    Set Variable    ${screenshot_dir}${/}${name}_${TEST NAME}.png
    Capture Page Screenshot    ${path}
    Attach File  ${path}    name=${TEST NAME} Screenshot    attachment_type=image/png

Teardown Actions
    [Documentation]    Perform teardown steps — capture screenshot on failure and close browser.
    Run Keyword If Test Failed    Capture Screenshot And Attach To Allure
    Close Application
    Log To Console    Test Teardown Completed
