# Code to generate dictionary summary reports

from utils import PRODUCTS, CUSTOMERS, compute_order_total
def total_products_sold(orders):
    total = 0
    for o in orders:
        total += o["quantity"]
    return total

def most_popular_product(orders):
    product_counts = {}
    for o in orders:
        pid = o["product_id"]
        if pid in product_counts:
            product_counts[pid] += o["quantity"]
        else:
            product_counts[pid] = o["quantity"]
          
    if not product_counts:
        return {"product_id": None, "product_name": None, "quantity": 0}

    most_popular_id = max(product_counts, key=product_counts.get)
    return {
        "product_id": most_popular_id,
        "product_name": PRODUCTS[most_popular_id]["name"],
        "quantity": product_counts[most_popular_id], }

def revenue_per_customer(orders, prods):
    revenue = {}
    for o in orders:
        cid = o["customer_id"]
        amount = compute_order_total(o, prods)
        if cid in revenue:
            revenue[cid] += amount
        else:
            revenue[cid] = amount

    result = {}
    for cid, total in revenue.items():
        name = CUSTOMERS[cid]
        result[name] = round(total, 2)
    return result

def build_report(orders, prods):
    return {
        "total_products_sold": total_products_sold(orders),
        "most_popular_product": most_popular_product(orders),
        "revenue_per_customer": revenue_per_customer(orders, prods),}
