# Spreadsheet Notes & Validation Documentation

## (a) Formulas
Below are the exact formulas typed into the first data row (row 2) of each added column across the dataset:

* **Category** (in cell `I2` of `orders` tab):
  `=VLOOKUP(D2, products!$A$2:$C$9, 3, FALSE)`
* **Unit Price** (in cell `J2` of `orders` tab):
  `=XLOOKUP(D2, products!$A$2:$A$9, products!$C$2:$C$9, "UNKNOWN_ITEM")`
* **Revenue Calc** (in cell `K2` of `orders` tab):
  `=J2*E2`

---

## (b) Summary Statistics (Completed Orders)
The aggregate calculations performed on the `amount` column for the 63 completed orders on the `completed_orders` tab yield the following results:

| Metric | Value |
| :--- | :--- |
| **COUNT** | 63 |
| **SUM** | $50,296.75 |
| **AVERAGE** | $798.36 |
| **MIN** | $27.96 |
| **MAX** | $2,399.96 |

---

## (c) Pivot Tables

### Pivot Table 1: Category vs Region (Sum of Amount)

| Category | Central | East | North | South | West | Grand Total |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Accessories** | $1,219.86 | $1,289.84 | $1,749.80 | $1,059.88 | $1,479.82 | **$6,799.20** |
| **Apparel** | $1,749.75 | $1,199.85 | $1,049.85 | $1,349.85 | $1,049.85 | **$6,399.15** |
| **Electronics** | $8,599.78 | $7,799.76 | $7,499.80 | $6,999.78 | $6,199.28 | **$37,098.40** |
| **Grand Total** | **$11,569.39** | **$10,289.45** | **$10,299.45** | **$9,409.51** | **$8,728.95** | **$50,296.75** |

### Pivot Table 2: Orders by Month (Sum of Amount & Count of Orders)

| Order Month | Sum of Amount | Count of Order ID |
| :--- | :---: | :---: |
| **2026-07** | $16,429.10 | 21 |
| **2026-08** | $16,849.05 | 21 |
| **2026-09** | $17,018.60 | 21 |
| **Grand Total** | **$50,296.75** | **63** |

---

## (d) Reconciliation Table

Reconciliation of summary statistics computed in the spreadsheet versus the results calculated in Part A (Question 5):

| Metric | Spreadsheet Result | Part A (q05) Result | Status |
| :--- | :--- | :--- | :--- |
| **COUNT** | 63 | 63 | Match |
| **SUM** | $50,296.75 | $50,296.75 | Match |
| **AVERAGE** | $798.36 | $798.36 | Match |

---

## (e) Data Validation

1. **Handling Missing Amounts:**
   - Missing `amount` values were populated by relying on `revenue_calc` (`unit_price * quantity`). Because unit prices from the lookup table and order quantities were fully present and verified, recalculating revenue ensured 100% complete transaction values without dropping valid orders.
2. **Data Type Consistency:**
   - Verified that numeric fields (`quantity`, `unit_price`, `amount`, `revenue_calc`) are recognized as numeric types rather than stored as text strings (e.g., using `ISNUMBER()` checks and formatting alignment).
   - Confirmed `order_month` is formatted strictly as plain text (e.g., `2026-09`) to avoid unintended date auto-conversions.
3. **Duplicates & Outlier Analysis:**
   - **Duplicate Order IDs:** No duplicate `order_id` values exist; every row has a unique key.
   - **Outliers / Maximum Values:** Among completed orders, the maximum order amount is **$2,399.96**. Multiple orders tie for this maximum value (specifically order IDs: `ORD-1008`, `ORD-1025`, `ORD-1044`, and `ORD-1072`, corresponding to purchases of 4 units of high-end Electronics at $599.99 each).
4. **Documentation for Successors:**
   - *Key Decision Note:* When adding new orders, ensure the lookup range on `products` (`$A$2:$C$9`) is expanded or referenced via structured table syntax so new catalog items auto-populate correctly without formula drift or lookup failures.

---

## (f) Setup Section

- **Tabs Created:** 
  1. `orders` (Primary data sheet)
  2. `completed_orders` (Filtered dataset & analytics tab)
- **Rows Imported into `orders`:** 90 data rows (rows 2 through 91).
- **`products` Tab Range:** `A1:C9` (Header row 1, data range `A2:C9`).
- **Filter & Sort Applied:** 
  - **Filter:** `status = completed` (resulting in 63 visible rows out of 90).
  - **Sort:** `amount` sorted in **Descending** order (largest to smallest) prior to copying as values into `completed_orders`.