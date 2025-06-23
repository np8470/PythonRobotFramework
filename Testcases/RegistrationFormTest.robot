*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}      https://vinothqaacademy.com/demo-site/
${browser}  chrome

*** Test Cases ***
LoginTest
    open browser    ${url}      ${browser}
    maximize browser window
    input text      id:vfb-5    Niraj
    input text      id:vfb-7    Patel
    select checkbox    id:vfb-20-0
    select checkbox    id:vfb-20-3
    click element    id:vfb-31-1
    input text      id:vfb-13-address   200, automation street
    input text      id:vfb-13-city      Ahmedabad
    input text      id:vfb-13-state     Gujarat
    select from list by value    id:vfb-13-country      India
    input text      id:vfb-13-zip       123456
    input text      id:vfb-14   automation@test.com
    input text      id:vfb-18           06/25/2025
    select from list by label    id:vfb-16-hour     10
    select from list by index    id:vfb-16-min      5
    input text      id:vfb-19   9876543210
    Scroll And Input Text       id:vfb-23      This is Python Robot Framework Demo.
    Scroll And Input Text       id:vfb-3        33
    Scroll And Click Element    id=vfb-4
    close browser


*** Keywords ***

Scroll And Input Text
    [Arguments]    ${locator}    ${text}
    scroll element into view    ${locator}
    input text      ${locator}    ${text}

Scroll And Click Element
    [Arguments]    ${locator}
    scroll element into view    ${locator}
    click button    ${locator}