*** Settings ***
Library      SeleniumLibrary
Resource     ../PageObject/RegistrationPage.robot
Resource     ../Resources/SeleniumKeywords.robot

*** Variables ***
${registration url}      https://vinothqaacademy.com/demo-site/
*** Keywords ***

RegistrationFormPOM
    [Arguments]          ${first_name}    ${last_name}    ${gender}    ${course}    ${address}    ${city}    ${state}    ${country}    ${postal_code}    ${email}    ${phone}    ${date_of_demo}    ${hour}    ${minute}    ${query}    ${verification_code}
    Launch Browser               ${registration url}                  ${default-browser}
    #maximize browser window
    Input Text                   ${txt_first_name}                    ${first_name}
    Input Text                   ${txt_last_name}                     ${last_name}
    Select Radio Button          ${radio_gender}                      ${gender}
    Fill Course Info             ${course}
    Input Text                   ${txt_address}                       ${address}
    Input Text                   ${txt_city}                          ${city}
    Input Text                   ${txt_state}                         ${state}
    Select From List By Value    ${select_country}                    ${country}
    Input Text                   ${txt_postal_code}                   ${postal_code}
    Input Text                   ${txt_email}                         ${email}
    Input Text                   ${txt_phone}                         ${phone}
    Input Text                   ${txt_date_of_demo}                  ${date_of_demo}
    Select From List By Label    ${select_hour}                       ${hour}
    Select From List By Index    ${select_minute}                     ${minute}
    Scroll And Input Text        ${txt_query}                         ${query}
    Scroll And Input Text        ${txt_verification_code}             ${verification_code}
    Scroll And Click Element     ${btn_submit}
    Sleep    2s
    Capture Page Screenshot

Fill Course Info
    [Arguments]    ${course}
    FOR    ${item}    IN    @{course}
        ${cleaned}=    Evaluate    '''${item}'''.strip().strip('"')
        ${locator}=    Set Variable    xpath=//input[@type='checkbox' and @value='${cleaned}']
        ${is_selected}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${locator}
        Run Keyword Unless    ${is_selected}    Click Element    ${locator}
    END
