# Utility functions for data conversion and filtering

PRODUCTS = {
    1: {"name": "Milk", "price": 2.5, "discount": 0.2},
    2: {"name": "Rice", "price": 15.0, "discount": 1.0},
    3: {"name": "Detergent", "price": 8.9, "discount": 0.75},
}

CUSTOMERS = {1: "John Smith", 2: "Mary Johnson"}
def convert_prices(products, rate, currency):
    return {
        pid: {"name": p["name"],
              "price": round(p["price"] * rate, 2),
              "discount": round(p["discount"] * rate, 2),
              "currency": currency}
        for pid, p in products.items()
    }
  
def compute_order_total(o, prods):
    p = prods[o["product_id"]]
    return round((p["price"] - p["discount"]) * o["quantity"], 2)

def flag_large_orders(orders, prods, threshold=100.0):
    out = []
    for o in orders:
        t = compute_order_total(o, prods)
        if t > threshold:
            out.append({**o, "total": t})
    return out
