*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***

${url}      https://vinothqaacademy.com/multiple-windows/
${browser}  chrome
${SCREENSHOT DIR}    ./screenshots/

*** Test Cases ***

NewBrowserWindowTest
    [Teardown]    Take Screenshot On Failure
    open browser    ${url}      ${browser}
    maximize browser window
    click element    name:newbrowserwindow123
    sleep    2s
    ${handles}=     get window handles
    ${second_handle}=    Set Variable    ${handles[3]}
    switch window      ${second_handle}
    #switch browser    1
    sleep    2s
    maximize browser window
    element should be visible    xpath:(//h2[normalize-space()='Project Details'])[1]
    close all browsers

NewTabTest
    [Teardown]    Take Screenshot On Failure
    open browser    ${url}      ${browser}
    maximize browser window
    click element    name:145newbrowsertab234
    sleep    2s
    ${handles}=     get window handles
    switch window    ${handles}[3]
    sleep    2s
    maximize browser window
    element should be visible    xpath:(//h2[normalize-space()='Project Details'])[1]
    close all browsers

*** Keywords ***

Take Screenshot On Failure
    Run Keyword If Test Failed
    ...    Create Directory    ${SCREENSHOT_DIR}
    Run Keyword If Test Failed
    ...    Capture Page Screenshot    ${SCREENSHOT_DIR}failure-${TEST NAME}.png