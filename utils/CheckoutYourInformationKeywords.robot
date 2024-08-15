*** Settings ***
Library      SeleniumLibrary
Library      Collections
Library    XML
Resource     Keywords.robot
Resource     ProductsKeywords.robot
Variables    ../pageObjects/CheckoutYourInformationLocators.py
Variables    ../utils/python/sharedVariables.py

*** Keywords ***
Is On Page
    [Arguments]    ${page}
    Verify Element Is Visible    ${title}

Fill Out Form
    [Arguments]    ${first_name_text}    ${last_name_text}    ${postal_code_text}
    Write Text With Condition    ${first_name}    ${first_name_text}
    Write Text With Condition    ${last_name}    ${last_name_text}
    Write Text With Condition    ${postal_code}    ${postal_code_text}

Click Continue
    Click Element With Condition    ${continue_btn}