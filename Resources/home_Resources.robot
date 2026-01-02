*** Variables ***
# Product add buttons
${PRODUCT_1_ADD}      xpath=(//android.view.ViewGroup[@content-desc="test-ADD TO CART"])[1]
${PRODUCT_2_ADD}      xpath=(//android.view.ViewGroup[@content-desc="test-ADD TO CART"])[1]


# Cart icon
${CART_ICON}          xpath=//android.view.ViewGroup[@content-desc="test-Cart"]/android.view.ViewGroup/android.widget.ImageView


# Cart item count badge
${CART_COUNT_BADGE}   xpath=//android.widget.TextView[@text="2"]
