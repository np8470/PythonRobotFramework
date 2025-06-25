*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

RegistrationForm
    [Arguments]          ${first_name}    ${last_name}    ${gender}    ${course}    ${address}    ${city}    ${state}    ${country}    ${postal_code}    ${email}    ${phone}    ${date_of_demo}    ${hour}    ${minute}    ${query}    ${verification_code}
    Input Text      id:vfb-5        ${first_name}
    Input Text      id:vfb-7        ${last_name}
    Select Radio Button    vfb-31   ${gender}
    #Click Element    id:vfb-20-0    # Static for "Selenium" checkbox
    Fill Course Info        ${course}
    Input Text      id:vfb-13-address    ${address}
    Input Text      id:vfb-13-city       ${city}
    Input Text      id:vfb-13-state      ${state}
    Select From List By Value    id:vfb-13-country    ${country}
    Input Text      id:vfb-13-zip        ${postal_code}
    Input Text      id:vfb-14            ${email}
    Input Text      id:vfb-19            ${phone}
    Input Text      id:vfb-18            ${date_of_demo}
    Select From List By Label    id:vfb-16-hour       ${hour}
    Select From List By Index    id:vfb-16-min        ${minute}
    Input Text      id:vfb-23            ${query}
    Input Text      id:vfb-3             ${verification_code}
    Click Button    id=vfb-4
    Sleep    2s
    Capture Page Screenshot


Fill Course Info
    [Arguments]    ${course}
    FOR    ${item}    IN    @{course.split(",")}
        ${cleaned} =    Evaluate    ${item}.strip().strip('"')
        Click Element    xpath=//input[@type='checkbox' and @value='${cleaned}']
    END

Close Browser
    close browser
