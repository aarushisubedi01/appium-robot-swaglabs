*** Settings ***
Library    AppiumLibrary
Resource   ../helper/common.robot
Resource   ../Pages/login_Page.robot
Resource   ../Pages/home_Page.robot
Resource   ../Resources/login_resources.robot

*** Test Cases ***
Add 3 Items And Verify Cart Count
    [Tags]    cart
    Open App
    Login    ${USERNAME}    ${PASSWORD}
    Add First Product To Cart
    Add Second Product To Cart
    Go To Cart
    Verify Two Items Added
