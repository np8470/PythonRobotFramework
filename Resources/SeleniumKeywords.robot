*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}
${default-browser}      chrome
#${default-browser}      firefox
#${default-browser}      headlesschrome
#${default-browser}      headlessfirefox


*** Keywords ***
Launch Browser
    [Arguments]     ${url}     ${default-browser}
    open browser    ${url}     ${default-browser}
    maximize browser window

Scroll And Input Text
    [Arguments]    ${locator}    ${text}
    scroll element into view     ${locator}
    element should be visible    ${locator}
    element should be enabled    ${locator}
    input text      ${locator}   ${text}

Scroll And Click Element
    [Arguments]    ${locator}
    scroll element into view     ${locator}
    element should be visible    ${locator}
    element should be enabled    ${locator}
    click element                ${locator}

Scroll And Click Button
    [Arguments]    ${locator}
    scroll element into view     ${locator}
    element should be visible    ${locator}
    element should be enabled    ${locator}
    click button                 ${locator}