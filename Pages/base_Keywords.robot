*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Wait And Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    10s
    Input Text    ${locator}    ${text}

Wait And Tap Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Tap    ${locator}
