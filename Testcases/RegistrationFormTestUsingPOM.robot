*** Settings ***
Library           SeleniumLibrary
Library           JSONLibrary
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../Resources/RegistrationFormKeywords.robot
Resource          ../Resources/SeleniumKeywords.robot
Resource          ../Resources/RegistrationFormKeywordsWithPOM.robot

*** Variables ***

${Test_Data}        RegistrationForm.json
${Testdata_Path}    ${CURDIR}${/}..${/}\\Testdata${/}\\${Test_Data}
${registration url}      https://vinothqaacademy.com/demo-site/

*** Test Cases ***
Registration Test using JSON Data Driven with POM
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

    RegistrationFormPOM    ${firstName}    ${last_name}    ${gender}    ${course}    ${address}    ${city}    ${state}    ${country}    ${postal_code}    ${email}    ${phone}    ${date_of_demo}    ${hour}    ${minute}    ${query}    ${verification_code}