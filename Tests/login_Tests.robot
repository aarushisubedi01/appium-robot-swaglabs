*** Settings ***
Library    AppiumLibrary
Resource   ../helper/common.robot
Resource   ../Pages/login_Page.robot
Resource   ../Resources/login_resources.robot

*** Test Cases ***
Validate Login Works
    Open App
    Login    ${USERNAME}    ${PASSWORD}
    Wait Until Page Contains Element    xpath=//android.view.ViewGroup[@content-desc="test-ADD TO CART"]    10s
