# Entry point for the MiniMart data reporting system

import json
from utils import PRODUCTS, CUSTOMERS, convert_prices, flag_large_orders
from report_generator import build_report

orders = [
    {"customer_id": 1, "product_id": 2, "quantity": 3},
    {"customer_id": 2, "product_id": 1, "quantity": 4},
    {"customer_id": 2, "product_id": 3, "quantity": 2},
]

prods = convert_prices(PRODUCTS, rate=0.78, currency="GBP")
report = build_report(orders, prods)
large_orders = flag_large_orders(orders, prods, threshold=100.0)

print("Total products sold:", report["total_products_sold"])
popular = report["most_popular_product"]
print("Most popular product:", popular["product_name"], "(qty", popular["quantity"], ")")
print("Revenue per customer:", report["revenue_per_customer"])
print("Large orders (>£100):", large_orders if large_orders else "None")

with open("report.json", "w", encoding="utf-8") as f:
    json.dump(report, f, indent=2)
