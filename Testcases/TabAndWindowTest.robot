*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${url}      https://vinothqaacademy.com/multiple-windows/
${browser}  chrome

*** Test Cases ***

NewBrowserWindowTest
    open browser    ${url}      ${browser}
    maximize browser window
    click element    name:newbrowserwindow123
    sleep    2s
    ${handles}=     get window handles
    ${second_handle}=    Set Variable    ${handles[1]}
    switch window      ${second_handle}
    #switch browser    1
    sleep    2s
    maximize browser window
    element should be visible    xpath:(//h2[normalize-space()='Project Details'])[1]
    close all browsers

NewTabTest
    open browser    ${url}      ${browser}
    maximize browser window
    click element    name:145newbrowsertab234
    sleep    2s
    ${handles}=     get window handles
    switch window    ${handles}[1]
    sleep    2s
    maximize browser window
    element should be visible    xpath:(//h2[normalize-space()='Project Details'])[1]
    close all browsers

*** Keywords ***
