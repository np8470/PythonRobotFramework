*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${alert_url}     https://vinothqaacademy.com/alert-and-popup/
${browser}      chrome

*** Test Cases ***
AlertAndPopupTest

    open browser    ${alert_url}     ${browser}
    maximize browser window
    set selenium implicit wait      3 Seconds

    click element    name:alertbox
    handle alert    accept
    ${alert_text}=    get text    id:demotwo
    should be equal as strings    ${alert_text}      You clicked on OK!

    click element    name:confirmalertbox
    alert should be present    Confirm pop up with OK and Cancel button     dismiss
    #handle alert    dismiss
    ${confirm_alert_text}=    get text    id:demo
    should be equal as strings    ${confirm_alert_text}      You clicked on Cancel!

    click element    name:promptalertbox1234
    input text into alert    Yes    accept
    #handle alert    accept
    ${prompt_alert_text}=    get text    id:demoone
    should be equal as strings    ${prompt_alert_text}      Thanks for Liking Automation

    close browser

*** Keywords ***
