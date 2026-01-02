*** Settings ***
Library    AppiumLibrary
Resource   base_Keywords.robot
Resource   ../Resources/login_resources.robot

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Wait And Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Wait And Input Text    ${PASSWORD_FIELD}    ${password}

Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Wait And Tap Element    ${LOGIN_BUTTON}
