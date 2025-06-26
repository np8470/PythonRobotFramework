*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/SeleniumKeywords.robot

*** Variables ***
${url}      https://vinothqaacademy.com/mouse-event/
#${browser}  chrome



*** Test Cases ***

UserDefineKeywordsTest
    Launch Browser      ${url}      ${default-browser}
    open context menu    id:rightclick
    sleep    2s
    ${page_title}=       Scroll And Click Element    xpath:(//a[normalize-space()='Mouse Event'])[3]
    log to console      ${page_title}
    log    ${page_title}
    should be equal as strings    ${page_title}     Demo Site – Mouse Event – Vinoth Tech Solutions
    close browser


*** Keywords ***
Scroll And Click Element
    [Arguments]    ${locator}
    scroll element into view    ${locator}
    element should be visible    ${locator}
    element should be enabled    ${locator}
    click element    ${locator}
    ${title}=   get title
    [Return]        ${title}