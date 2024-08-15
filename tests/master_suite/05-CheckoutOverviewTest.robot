*** Settings ***
Library     SeleniumLibrary
Resource    ../../utils/Keywords.robot
Resource    ../../utils/CheckoutOverviewKeywords.robot

*** Test Cases ***
Validate Is On Checkout Overview Page
    CheckoutOverviewKeywords.Is On Page    "Checkout: Overview"

Validate Total Price Before Tax
    ${isValid}=    Validate Price List Before Tax    $
    Should Be True    ${isValid}

Validate Total Price After Tax
    ${isValid}=    Validate Price List After Tax
    Should Be True    ${isValid}

Click Finish
    Click Finish Button

Validate Is On Checkout Complete Page
    CheckoutOverviewKeywords.Is On Page    "Checkout: Complete!"