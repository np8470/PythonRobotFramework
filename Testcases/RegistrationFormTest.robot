*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/SeleniumKeywords.robot
#Suite Setup         - Once before all test cases	Initialize suite-level setup
#Suite Teardown      - Suite Teardown	Once after all test cases	Clean up after the whole suite
#Test Template       - Allows data-driven testing by running a test keyword multiple times with different arguments.

*** Variables ***
${registration url}      https://vinothqaacademy.com/demo-site/
${dropdown url}      https://vinothqaacademy.com/drop-down/

*** Test Cases ***
RegistrationFormTest
    Launch Browser      ${registration url}      ${default-browser}
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
    Launch Browser      ${dropdown url}       ${default-browser}
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
