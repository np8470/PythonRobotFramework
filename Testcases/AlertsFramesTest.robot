*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${alert_url}     https://vinothqaacademy.com/alert-and-popup/
${frame_url}     https://vinothqaacademy.com/iframe/
${browser}      chrome

*** Test Cases ***
AlertAndPopupTest

    open browser    ${alert_url}     ${browser}
    maximize browser window
    set selenium implicit wait      3 Seconds

    # AlertBox
    click element    name:alertbox
    handle alert    accept
    ${alert_text}=    get text    id:demotwo
    should be equal as strings    ${alert_text}      You clicked on OK!

    # Confirmation Alert Box
    click element    name:confirmalertbox
    alert should be present    Confirm pop up with OK and Cancel button     dismiss
    #handle alert    dismiss
    ${confirm_alert_text}=    get text    id:demo
    should be equal as strings    ${confirm_alert_text}      You clicked on Cancel!

    # Prompt Alert Box
    click element    name:promptalertbox1234
    input text into alert    Yes    accept
    #handle alert    accept
    ${prompt_alert_text}=    get text    id:demoone
    should be equal as strings    ${prompt_alert_text}      Thanks for Liking Automation

    close browser

FramesTest
    open browser    ${frame_url}    ${browser}
    maximize browser window

    select frame    employeetable
    element should be visible    xpath://h2[normalize-space()='Project Details']
    unselect frame

    sleep   3 seconds

    select frame    popuppage
    element should be visible    xpath://h1[normalize-space()='Alert and PopUp']
    unselect frame

    sleep   3 seconds

    select frame    registeruser
    element should be visible    xpath://h3[normalize-space()='Registration Form']
    unselect frame

    close browser

*** Keywords ***
