*** Settings ***
Library     AppiumLibrary
Library     JSONLibrary
Resource    ../helper/common.robot
Resource    ../Pages/login_Page.robot

*** Variables ***
${DATA_FILE}    ${CURDIR}/../Data/login_Data.json
${LOCKED_ERROR}  xpath=//android.widget.TextView[@text="Sorry, this user has been locked out."]
*** Test Cases ***
Login Data Driven Test (JSON)
    ${users}=    Load JSON From File    ${DATA_FILE}
    FOR    ${user}    IN    @{users}
        Log To Console    \n===== Testing Login For: ${user['username']} =====
        Open App
        Login    ${user['username']}    ${user['password']}
        Validate Login Result    ${user['expected']}
        Close Application
    END


*** Keywords ***
Validate Login Result
    [Arguments]    ${expected}

    # SUCCESS users must reach product page
    IF    '${expected}' == 'success'
        Wait Until Page Contains Element    xpath=//android.view.ViewGroup[@content-desc="test-ADD TO CART"]    10s
        Log To Console    Login Successful
     ELSE IF    '${expected}' == 'error'
        Wait Until Element Is Visible    ${LOCKED_ERROR}    10s
        Log To Console    Login Blocked - Correct Expected Behavior
    END
