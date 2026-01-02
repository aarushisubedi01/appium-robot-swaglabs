*** Settings ***
Library    AppiumLibrary
Resource   base_Keywords.robot
Resource   ../Resources/home_Resources.robot

*** Keywords ***
Add First Product To Cart
    Wait And Tap Element    ${PRODUCT_1_ADD}

Add Second Product To Cart
    Wait And Tap Element    ${PRODUCT_2_ADD}

Go To Cart
    Wait And Tap Element    ${CART_ICON}

Verify Two Items Added
    Wait Until Element Is Visible    ${CART_COUNT_BADGE}    10s
