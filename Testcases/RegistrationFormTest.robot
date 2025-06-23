*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${registration url}      https://vinothqaacademy.com/demo-site/
${dropdown url}      https://vinothqaacademy.com/drop-down/
${browser}  chrome

*** Test Cases ***
RegistrationFormTest
    open browser    ${registration url}      ${browser}
    maximize browser window
    set selenium speed    2 seconds    # 3 sec wait after each element interaction
    title should be    Demo Site – Registration Form – Vinoth Tech Solutions
    ${firsrNameElement}    set variable    id:vfb-5
    input text      ${firsrNameElement}    Niraj
    input text      id:vfb-7    Patel
    select checkbox    id:vfb-20-0
    select checkbox    id:vfb-20-3
    select radio button    vfb-31       Male    # (name of radio button, value of radio button)
    #click element    id:vfb-31-1
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
    sleep    3
    close browser

DropdownTest
    open browser    ${dropdown url}     ${browser}
    maximize browser window
    ${time}=    get selenium timeout
    log to console    ${time}
    set selenium timeout    2 seconds
    #set selenium implicit wait    2 seconds
    wait until page contains    Simple Dropdown
    select from list by value    id:simpleDropdown      NY
    select from list by index    id:FromAccount         1
    select from list by label    name:programming       Java    Python
    close browser

*** Keywords ***

Scroll And Input Text
    [Arguments]    ${locator}    ${text}
    scroll element into view    ${locator}
    element should be visible    ${locator}
    element should be enabled    ${locator}
    input text      ${locator}    ${text}

Scroll And Click Element
    [Arguments]    ${locator}
    scroll element into view    ${locator}
    element should be visible    ${locator}
    element should be enabled    ${locator}
    click button    ${locator}