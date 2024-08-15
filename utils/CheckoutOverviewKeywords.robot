*** Settings ***
Library      SeleniumLibrary
Library      Collections
Library      XML
Resource     Keywords.robot
Resource     ProductsKeywords.robot
Variables    ../pageObjects/CheckoutOverviewLocators.py
Variables    ../utils/python/sharedVariables.py

*** Variables ***
${total_before_tax_expected}=    0
${total_before_tax_current}=    0

*** Keywords ***
Is On Page
    [Arguments]    ${page}
    Verify Element Is Visible    ${title}

Validate Price List Before Tax
    [Arguments]    ${currency}
    ${itemsPriceInCartElements}=    Get WebElements    ${inventory_price_list}
    FOR    ${element}    IN    @{itemsPriceInCartElements}
        ${elementText}=    Get Text    ${element}
        ${new_price}=    Replace Pattern In String    ${elementText}    ${currency}
        ${total_before_tax_current}=    Evaluate    ${total_before_tax_current} + ${new_price}
    END

    FOR    ${element}    IN    @{itemsPriceInCart}
        ${total_before_tax_expected}=    Evaluate    ${total_before_tax_expected} + ${element}
    END
    
    ${result}=    Run Keyword And Return Status    Should Be Equal As Integers    ${total_before_tax_expected}    ${total_before_tax_current}
    ${final_result}=    Evaluate    True if ${result} is True else False
    RETURN    ${final_result}

Validate Price List After Tax
    ${total_after_tax_current}=    Evaluate    ${total_before_tax_current} * ${tax}
    ${total_after_tax_expected}=    Evaluate    ${total_before_tax_expected} * ${tax}
    
    ${result}=    Run Keyword And Return Status    Should Be Equal As Integers    ${total_before_tax_expected}    ${total_after_tax_current}
    RETURN    ${result}

Click Finish Button
    Click Element With Condition    ${finish_btn}