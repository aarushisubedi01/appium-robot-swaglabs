from robot.api.deco import keyword

@keyword
def get_product_prices_from_elements(elements):
    """Converts list of WebElements to list of floats."""
    prices = []
    for e in elements:
        text = e.text  # e.g., "$49.99"
        number = float(text.replace("$", "").strip())
        prices.append(number)
    return prices
