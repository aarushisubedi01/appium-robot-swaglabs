*** Variables ***
# Cart & checkout buttons
${CHECKOUT_BUTTON}        xpath=//android.view.ViewGroup[@content-desc="test-CHECKOUT"]
${CONTINUE_BUTTON}        xpath=//android.widget.TextView[@text="CONTINUE"]
${FINISH_BUTTON}          xpath=//android.view.ViewGroup[@content-desc="test-FINISH"]

# Checkout form fields
${FIRST_NAME_FIELD}       xpath=//android.widget.EditText[@content-desc="test-First Name"]
${LAST_NAME_FIELD}        xpath=//android.widget.EditText[@content-desc="test-Last Name"]
${POSTAL_CODE_FIELD}      xpath=//android.widget.EditText[@content-desc="test-Zip/Postal Code"]
${FINISH_BUTTON}        xpath=//android.view.ViewGroup[@content-desc="test-FINISH"]

# Success message
${CHECKOUT_COMPLETE_TEXT}       xpath=//android.widget.TextView[@text="CHECKOUT: COMPLETE!"]

