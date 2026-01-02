*** Variables ***
# Test Data
${USERNAME}          standard_user
${PASSWORD}          secret_sauce

# Locators
${USERNAME_FIELD}    xpath=//android.widget.EditText[@content-desc="test-Username"]
${PASSWORD_FIELD}    xpath=//android.widget.EditText[@content-desc="test-Password"]
${LOGIN_BUTTON}      xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]