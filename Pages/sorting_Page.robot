*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    ../helper/price_utils.py
Resource   ../Helper/common.robot
Resource   ../Resources/sorting_Resources.robot

*** Keywords ***
Open Sorting Options
    Wait Until Element Is Visible    ${SORT_DROPDOWN}    10s
    Tap    ${SORT_DROPDOWN}

Select Sorting Option
    [Arguments]    ${option_locator}
    Wait Until Element Is Visible    ${option_locator}    5s
    Tap    ${option_locator}

Get Product Names
    ${items}=    Get Webelements    ${PRODUCT_NAME_LIST}
    @{names}=    Create List
    FOR    ${item}    IN    @{items}
        ${text}=    Get Text    ${item}
        Append To List    ${names}    ${text}
    END
    RETURN    ${names}

Get Product Prices
    ${items}=    Get Webelements    ${PRODUCT_PRICE_LIST}
    ${prices}=   Get Product Prices From Elements    ${items}   # pass elements to Python
    RETURN      ${prices}


