*** Settings ***
Library     SeleniumLibrary
Resource    ../../utils/Keywords.robot
Resource    ../../utils/ProductsKeywords.robot

*** Test Cases ***
Sort Items And Validate
    [Template]    Validate Selected Sort
    Name (A to Z)           ASC     alpha
    Name (Z to A)           DESC    alpha 
    Price (low to high)     ASC     numeric
    Price (high to low)     DESC    numeric

Add Items To Shopping Cart
    Is On Page    "Products"
    Add Or Remove Items From Cart    4    Add
    Validate Count In Cart    ${shoppingCartBadge}    4

Remove Items To Shopping Cart
    Is On Page    "Products"
    Add Or Remove Items From Cart    1    Remove
    Validate Count In Cart    ${shoppingCartBadge}    3

Click On Shopping Cart
    Go To Shopping Cart    ${shoppingCartLink}
    