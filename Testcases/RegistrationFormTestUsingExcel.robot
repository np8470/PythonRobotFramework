#This is a test file

*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    Testdata/RegistrationForm.xlsx      sheet_name=Sheet1
Resource          ../Resources/RegistrationFormKeywords.robot
Resource          ../Resources/SeleniumKeywords.robot

Suite Setup         Launch Browser        https://vinothqaacademy.com/demo-site/    chrome
#Test Template       RegistrationForm
Suite Teardown      Close Browser

*** Test Cases ***
Data Driven Registration Test
    [Template]      RegistrationForm
