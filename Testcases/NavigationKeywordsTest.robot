*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${first_url}    https://vinothqaacademy.com/demo-site/
${second_url}   https://vinothqaacademy.com/multiple-windows/
${browser}      chrome

*** Test Cases ***
NavigationTest
    open browser    ${first_url}    ${browser}
    maximize browser window
    ${loc}=  get location
    log to console    ${loc}

    sleep    2s

    go to    ${second_url}
    ${loc}=  get location
    log to console    ${loc}

    sleep    2s

    go back
    ${loc}=  get location
    log to console    ${loc}

    close browser

*** Keywords ***
