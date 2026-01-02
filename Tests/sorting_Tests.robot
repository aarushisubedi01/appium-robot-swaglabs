*** Settings ***
Library    AppiumLibrary
Library    JSONLibrary
Library    Collections
Resource   ../Helper/common.robot
Resource   ../Resources/login_resources.robot
Resource   ../Pages/login_Page.robot
Resource   ../Pages/sorting_Page.robot

*** Variables ***
${DATA_FILE}    ../Data/sorting_Data.json

*** Test Cases ***
Validate Sorting Against JSON Data
    Open App
    Login    ${USERNAME}    ${PASSWORD}
    ${json}=    Load JSON From File    ${DATA_FILE}

    FOR    ${item}    IN    @{json}
        ${locator_name}=    Get From Dictionary    ${item}    locator
        ${expected}=        Get From Dictionary    ${item}    expectedOrder
        ${locator}=         Get Variable Value    ${${locator_name}}
        Perform Sorting And Verify    ${locator}    ${expected}
    END

*** Keywords ***
Perform Sorting And Verify
    [Arguments]    ${locator}    ${expected}
    Open Sorting Options
    Select Sorting Option    ${locator}

    IF    '${expected}' == 'ascending'
        Validate Names Ascending
    ELSE IF    '${expected}' == 'descending'
        Validate Names Descending
    ELSE IF    '${expected}' == 'price_low'
        Validate Price Low To High
    ELSE IF    '${expected}' == 'price_high'
        Validate Price High To Low
    END

Validate Names Ascending
    ${names}=    Get Product Names
    ${sorted}=    Evaluate    sorted(${names})
    Should Be Equal    ${names}    ${sorted}

Validate Names Descending
    ${names}=    Get Product Names
    ${sorted}=    Evaluate    sorted(${names}, reverse=True)
    Should Be Equal    ${names}    ${sorted}

Validate Price Low To High
    ${prices}=    Get Product Prices
    ${sorted}=    Evaluate    sorted(${prices})
    Should Be Equal    ${prices}    ${sorted}

Validate Price High To Low
    ${prices}=    Get Product Prices
    ${sorted}=    Evaluate    sorted(${prices}, reverse=True)
    Should Be Equal    ${prices}    ${sorted}
