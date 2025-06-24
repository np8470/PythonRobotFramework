*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
ForLoopDemoTest

    LOG TO CONSOLE      ****************Option-1**********************
    FOR    ${i}    IN RANGE    1   10
    LOG TO CONSOLE    ${i}
    END


     LOG TO CONSOLE      ****************Option-2**********************
     @{items}       create list    1    2   3   4   5
     FOR    ${i}    IN    @{items}
     LOG TO CONSOLE    ${i}
     END

     LOG TO CONSOLE      ****************Option-3**********************
     FOR    ${i}    IN    Automation      Python      RobotFramework      Selenium
     LOG TO CONSOLE    ${i}
     END

     LOG TO CONSOLE      ****************Option-4**********************
     @{names}       create list    Java    C#   JS   TS   Ruby
     FOR    ${i}    IN    @{names}
     LOG TO CONSOLE    ${i}
     END

     LOG TO CONSOLE      ****************Option-5**********************
     @{items}       create list    1    2   3   4   5
     FOR    ${i}    IN    @{items}
     LOG TO CONSOLE    ${i}
     exit for loop if    ${i}==4
     END