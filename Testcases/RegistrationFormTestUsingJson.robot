#This is a test file

*** Settings ***
Library           SeleniumLibrary
Library           JSONLibrary
Library           OperatingSystem
Library           Collections
Library           String
#Library           DataDriver    Testdata/RegistrationForm.json
Resource          ../Resources/RegistrationFormKeywords.robot
Resource          ../Resources/SeleniumKeywords.robot

#Suite Setup         Launch Browser        https://vinothqaacademy.com/demo-site/    chrome
#Test Template       RegistrationForm
#Suite Teardown      Close Browser

*** Variables ***
${Test_Data}        RegistrationForm.json
${Testdata_Path}    ${CURDIR}${/}..${/}\\Testdata${/}\\${Test_Data}


*** Test Cases ***
Data Driven Registration Test using JSON
    # Load json data from file
    ${json_data}=    load json from file    ${Testdata_Path}
    log to console       ${json_data}

    # Extract the first object from the list
    #${first_record}=    get from list    ${json_data}   0
    # extract each value from  first object of json

    # ${firstName}=       get value from json    ${first_record}     first_name
    # log to console      First Name: ${firstName}


    ${firstName}=           Get From Dictionary         ${json_data}        first_name
    #log to console          First Name: ${firstName}
    ${lastName}=            Get From Dictionary         ${json_data}        last_name
    ${gender}=              Get From Dictionary         ${json_data}        gender
    ${course}=              Get From Dictionary         ${json_data}        course
    ${country}=             Get From Dictionary         ${json_data}        country
    ${address}=             Get From Dictionary         ${json_data}        address
    ${city}=                Get From Dictionary         ${json_data}        city
    ${state}=               Get From Dictionary         ${json_data}        state
    ${postalCode}=          Get From Dictionary         ${json_data}        postal_code
    ${email}=               Get From Dictionary         ${json_data}        email
    ${dateOfDemo}=          Get From Dictionary         ${json_data}        date_of_demo
    ${hour}=                Get From Dictionary         ${json_data}        hour
    ${minute}=              Get From Dictionary         ${json_data}        minute
    ${phone}=               Get From Dictionary         ${json_data}        phone
    ${query}=               Get From Dictionary         ${json_data}        query
    ${verificationCode}=    Get From Dictionary         ${json_data}        verification_code

    RegistrationForm    ${firstName}    ${last_name}    ${gender}    ${course}    ${address}    ${city}    ${state}    ${country}    ${postal_code}    ${email}    ${phone}    ${date_of_demo}    ${hour}    ${minute}    ${query}    ${verification_code}

*** Keywords ***

RegistrationForm
    [Arguments]          ${first_name}    ${lastName}    ${gender}    ${course}    ${address}    ${city}    ${state}    ${country}    ${postalCode}    ${email}    ${phone}    ${dateOfDemo}    ${hour}    ${minute}    ${query}    ${verificationCode}
    Launch Browser    https://vinothqaacademy.com/demo-site/    chrome
    maximize browser window
    Input Text      id:vfb-5        ${first_name}
    Input Text      id:vfb-7        ${last_name}
    Select Radio Button    vfb-31   ${gender}
    #Click Element    id:vfb-20-0    # Static for one checkbox
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
    Scroll And Input Text      id:vfb-23            ${query}
    Scroll And Input Text      id:vfb-3             ${verification_code}
    Scroll And Click Element    id=vfb-4
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
