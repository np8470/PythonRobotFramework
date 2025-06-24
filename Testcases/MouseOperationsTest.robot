*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}      https://vinothqaacademy.com/mouse-event/
${browser}  chrome

*** Test Cases ***

DragAndDropEvent
    open browser    ${url}      ${browser}
    maximize browser window
    drag and drop    id:draggableElement    id:droppableElement
    sleep    2s
    #close browser

MouseHoveTooltipEvent
    #open browser    ${url}      ${browser}
    #maximize browser window
    mouse over    id:textbox
    sleep    1s
    #${tooltip}=    Get Text    css=.tooltip-inner
    #Should Be Equal As Strings    ${tooltip}    Enter First Name

    ${tooltip}=    Get Element Attribute    id=textbox    title
    Should Be Equal As Strings    ${tooltip}    Enter First Name
    #close browser

DoubleClickEvent
    #open browser    ${url}      ${browser}
    #maximize browser window
    double click element    id:dblclick
    sleep    2s
    ${message}=     get text    id:demo
    should be equal as strings      ${message}      Double Click Action is Performed
    #element should be visible    xpath:(//h3[normalize-space()='Mouse Actions - Right Click or Context Click'])[1]
    #close browser

RightClickTest
    #open browser    ${url}      ${browser}
    #maximize browser window
    open context menu    id:rightclick
    sleep    2s
    Scroll And Click Element    xpath:(//a[normalize-space()='Mouse Event'])[3]
    close browser

*** Keywords ***
Scroll And Click Element
    [Arguments]    ${locator}
    scroll element into view    ${locator}
    element should be visible    ${locator}
    element should be enabled    ${locator}
    click element    ${locator}
