*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open My Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Write Text With Condition
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Input Text    ${locator}    ${value}

Click Element With Condition
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Button    ${locator}

Verify Element Is Visible
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}

Verify Element Is Invisible
    [Arguments]    ${locator}
    Element Should Not Be Visible    ${locator}

Verify Title
    [Arguments]    ${title}
    Title Should Be    ${title}