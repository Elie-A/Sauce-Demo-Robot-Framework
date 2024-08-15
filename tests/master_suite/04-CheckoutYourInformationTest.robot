*** Settings ***
Library     SeleniumLibrary
Resource    ../../utils/Keywords.robot
Resource    ../../utils/CheckoutYourInformationKeywords.robot

*** Test Cases ***
Validate Is On Checkout My Information Page
    CheckoutYourInformationKeywords.Is On Page    "Checkout: Your Information"

Enter Your Information
    Fill Out Form    first_name_text    last_name_text    postal_code_text

Continue Checkout
    Click Continue