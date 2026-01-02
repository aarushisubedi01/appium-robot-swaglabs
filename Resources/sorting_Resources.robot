*** Variables ***
# Sorting dropdown
${SORT_DROPDOWN}          xpath=//android.view.ViewGroup[@content-desc="test-Modal Selector Button"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView


# Sorting menu options
${SORT_AZ}                xpath=//android.widget.TextView[@text="Name (A to Z)"]
${SORT_ZA}                xpath=//android.widget.TextView[@text="Name (Z to A)"]
${SORT_LOW_HIGH}          xpath=//android.widget.TextView[@text="Price (low to high)"]
${SORT_HIGH_LOW}          xpath=//android.widget.TextView[@text="Price (high to low)"]

# Product Name List
${PRODUCT_NAME_LIST}      xpath=//android.widget.TextView[contains(@content-desc, "test-Item title")]

# Product Price List
${PRODUCT_PRICE_LIST}     xpath=//android.widget.TextView[@content-desc="test-Price"]


