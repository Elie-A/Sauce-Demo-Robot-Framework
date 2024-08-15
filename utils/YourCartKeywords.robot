*** Settings ***
Library      SeleniumLibrary
Library      Collections
Library    XML
Resource     Keywords.robot
Resource     ProductsKeywords.robot
Variables    ../pageObjects/YourCartPageLocators.py
Variables    ../utils/python/sharedVariables.py

*** Keywords ***
Is On Page
    [Arguments]    ${page}
    Verify Element Is Visible    ${title}

Click On Checkout
    Click Element With Condition    ${checkout}

Validate Items In Cart
    ${itemsInCartElements}=    Get WebElements    ${cartItemsList}
    FOR    ${element}    IN    @{itemsInCartElements}
        ${elementText}=    Get Text    ${element}
        Append To List    ${itemsInCart}    ${elementText}
    END
    ${result}=    Run Keyword And Return Status    Lists Should Be Equal    ${itemsInCart}    ${listOfProductInCart}    ignore_order=True
    ${final_result}=    Evaluate    True if ${result} is True else False
    RETURN    ${final_result}

Validate Items Price In Cart
    [Arguments]    ${currency}
    ${itemsPriceInCartElements}=    Get WebElements    ${cartItemsPriceList}
    FOR    ${element}    IN    @{itemsPriceInCartElements}
        ${elementText}=    Get Text    ${element}
        ${new_price}=    Replace Pattern In String    ${elementText}    ${currency}
        Append To List    ${itemsPriceInCart}    ${new_price}
    END
    ${result}=    Run Keyword And Return Status    Lists Should Be Equal    ${itemsPriceInCart}    ${listOfPricesInCart}    ignore_order=True
    ${final_result}=    Evaluate    True if ${result} is True else False
    RETURN    ${final_result}

Go To Checkout
    [Arguments]    ${locator}
    Click Element With Condition    ${locator}