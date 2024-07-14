*** Settings ***
Library      SeleniumLibrary
Resource     Keywords.robot
Variables    ../pageObjects/LoginPageLocators.py

*** Keywords ***
Enter Username
    [Arguments]    ${value}
    Write Text With Condition    ${username_field}    ${value}

Enter Password
    [Arguments]    ${value}
    Write Text With Condition    ${password_field}    ${value}

Click Login
    Click Element With Condition    ${login_button}

Is On Page
    [Arguments]    ${page}
    Verify Element Is Visible    ${title}