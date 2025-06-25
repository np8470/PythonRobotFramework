*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/resources.robot
*** Variables ***
${url}      https://vinothqaacademy.com/webtable/

*** Test Cases ***
WebHTMLTest
    Launch Browser      ${url}      ${default-browser}
    ${rows}     get element count       xpath://table[@id='myTable']//tbody/tr
    log to console      ${rows}
    ${columns}  get element count       xpath://table[@id='myTable']//thead//tr//th
    log to console      ${columns}
    table column should contain     xpath://table[@id='myTable']    3       Role
    table row should contain    xpath://table[@id='myTable']    2       Software Engineer
    close browser