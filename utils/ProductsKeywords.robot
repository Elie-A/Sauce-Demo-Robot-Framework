*** Settings ***
Library      SeleniumLibrary
Library      Collections
Resource     Keywords.robot
Variables    ../pageObjects/ProductsPageLocators.py

*** Variables ***
${elements}
${genericLocator}=     //button[contains(text(),'{}')]
@{listOfProductInCart}=  []
@{listOfPricesInCart}=  []  
${total_count}

*** Keywords ***
Is On Page
    [Arguments]    ${page}
    Verify Element Is Visible    ${title}

Select Sort By
    [Arguments]    ${sortBy}
    Select From List By Label    ${dropdown}    ${sortBy}

Validate Selected Sort
    [Arguments]    ${sortBy}    ${order}    ${sortType}
    Select Sort By    ${sortBy}
    IF    "${sortType}" == "alpha"
        ${elements}=    Get WebElements    ${inventoryItemsList}
        ${texts}=    Extract Texts From Elements    ${elements}
        ${sorted}=    Is List Of Strings Sorted    ${texts}    ${order}
        Should Be True    ${sorted}
    ELSE IF    "${sortType}" == "numeric"
        ${elements}=    Get WebElements    ${itemPricesList}
        ${texts}=    Extract Texts From Elements    ${elements}
        ${numbers}=    Convert Texts To Numbers    ${texts}    $
        ${sorted}=    Is List Of Numbers Sorted    ${numbers}    ${order}
        Should Be True    ${sorted}
    ELSE
        Log    "Invalid sort type: ${sortType}"
    END
Add Or Remove Items From Cart
    [Arguments]    ${total}    ${text}
    ${total_count}=    Set Variable    ${total}
    ${locator}=    Return XPath Locator    ${genericLocator}    ${text}
    ${list}=    Get WebElements    ${locator}
    ${elements_names}=    Get WebElements    ${inventoryItemsList}
    ${elements_prices}=   Get WebElements    ${itemPricesList}
    FOR    ${i}    IN RANGE    0    ${total}
        ${button_text}=    Get Text    ${list}[${i}]
        ${res}=    Run Keyword And Return Status    String contains    ${button_text}    Add 
        IF    ${res}
            Click Element    ${list}[${i}]
            ${name}=    Get Text    ${elements_names}[${i}]
            Append To List    ${listOfProductInCart}    ${name}
            ${price}=    Get Text    ${elements_prices}[${i}]
            ${price_new}=    Replace Pattern In String    ${price}    $
            Append To List    ${listOfPricesInCart}    ${price_new}
        ELSE
            Click Element    ${list}[${i}]
            ${name}=    Get Text    ${elements_names}[${i}]
            ${price}=    Get Text    ${elements_prices}[${i}]
            ${price_new}=    Replace Pattern In String    ${price}    $
            Remove From List    ${listOfProductInCart}    ${name}
            Remove From List    ${listOfPricesInCart}    ${price_new}
        END
    END

Validate Count In Cart
    [Arguments]    ${element}    ${expected_count}
    ${element_text}=    Get Text    ${element}
    ${res}=    Should Be Equal As Integers    ${element_text}    ${expected_count}

Go To Shopping Cart
    [Arguments]    ${locator}
    Click Element With Condition    ${locator}