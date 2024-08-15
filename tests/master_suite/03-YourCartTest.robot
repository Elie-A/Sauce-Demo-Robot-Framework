*** Settings ***
Library     SeleniumLibrary
Resource    ../../utils/Keywords.robot
Resource    ../../utils/YourCartKeywords.robot

*** Test Cases ***
Validate Is On My Cart Page
    YourCartKeywords.Is On Page    "My Cart"

Validate Items Name In Cart
    ${isValid}=    Validate Items In Cart
    Should Be True    ${isValid}

Validate Items Name In Cart
    ${isValid}=    Validate Items Price In Cart    $
    Should Be True    ${isValid}

Click On Checkout
    Go To Checkout    ${checkout}