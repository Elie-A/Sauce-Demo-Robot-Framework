*** Settings ***
Library    SeleniumLibrary
Library   ../utils/python/miscUtils.py
Library    Collections
Library    String

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
    Click Element    ${locator}

Click Element N Times
    [Arguments]    ${total}    ${locator}
    FOR    ${i}    IN RANGE    1    ${total}
        Wait Until Element Is Visible    ${locator}
        Wait Until Element Is Enabled    ${locator}
        Click Element    ${locator}
    END

String contains
    [Arguments]    ${string}    ${pattern}
    ${found}=     Run Keyword And Return Status    Should Contain    ${string}    ${pattern}
    RETURN    ${found}

Verify Element Is Visible
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}

Verify Element Is Invisible
    [Arguments]    ${locator}
    Element Should Not Be Visible    ${locator}

Verify Title
    [Arguments]    ${title}
    Title Should Be    ${title}

Extract Texts From Elements
    [Arguments]    ${elements}
    ${texts}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List    ${texts}    ${text}
    END
    RETURN    ${texts}

Convert Texts To Numbers
    [Arguments]    ${texts}    ${symbol}
    ${numbers}=    Create List
    FOR    ${text}    IN    @{texts}
        ${number}=    Evaluate    float('${text}'.replace('${symbol}', '').replace(',', ''))
        Append To List    ${numbers}    ${number}
    END
    RETURN    ${numbers}