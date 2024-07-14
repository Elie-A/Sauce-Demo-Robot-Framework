*** Settings ***
Library     SeleniumLibrary
Resource    ../../utils/Keywords.robot
Resource    ../../utils/LoginKeywords.robot

*** Variables ***
${browser}    chrome
${url}        https://www.saucedemo.com/
${username}   standard_user
${password}   secret_sauce

*** Test Cases ***
Login Test
    Open My Browser   ${url}    ${browser}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Is On Page    "Products"    