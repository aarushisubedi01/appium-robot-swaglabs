*** Settings ***
Library    AppiumLibrary
Resource   ../Pages/base_Keywords.robot
Resource   ../Resources/checkout_Resources.robot

*** Keywords ***
Go To Checkout
    Wait And Tap Element    ${CHECKOUT_BUTTON}

Enter Checkout Information
    [Arguments]    ${first}    ${last}    ${zip}
    Wait And Input Text    ${FIRST_NAME_FIELD}    ${first}
    Wait And Input Text    ${LAST_NAME_FIELD}     ${last}
    Wait And Input Text    ${POSTAL_CODE_FIELD}   ${zip}
    Wait And Tap Element   ${CONTINUE_BUTTON}

Scroll Down Until Finish Visible
    ${width}=     Get Window Width
    ${height}=    Get Window Height

    ${start_x}=   Evaluate    int(${width} * 0.5)
    ${start_y}=   Evaluate    int(${height} * 0.75)
    ${end_y}=     Evaluate    int(${height} * 0.35)

    FOR    ${i}    IN RANGE    0    4
        ${visible}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible    ${FINISH_BUTTON}    2s
        Exit For Loop If    ${visible}

        Swipe
        ...    start_x=${start_x}
        ...    start_y=${start_y}
        ...    end_x=${start_x}
        ...    end_y=${end_y}
        ...    duration=800ms
    END

Finish Checkout
    Scroll Down Until Finish Visible
    Wait Until Element Is Visible    ${FINISH_BUTTON}    10s
    Tap    ${FINISH_BUTTON}

Verify Checkout Success
    Wait Until Element Is Visible    ${CHECKOUT_COMPLETE_TEXT}    10s
