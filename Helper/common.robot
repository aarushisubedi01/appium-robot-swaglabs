*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}    http://localhost:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${AUTOMATION_NAME}  UiAutomator2
${APP_PACKAGE}      com.swaglabsmobileapp
${APP_ACTIVITY}     com.swaglabsmobileapp.MainActivity

*** Keywords ***
Open App
    Open Application
    ...    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@content-desc="test-Username"]    10s