# Dashboard Specification

## Data Source

**Source File:** `orders_enriched.csv - completed_orders

https://public.tableau.com/authoring/productssaledetails/Sheet1#1

The dataset contains transaction-level order details. Below is the classification of each of the 13 columns into **Dimension** (categorical/descriptive fields) or **Measure** (numeric values suitable for aggregation).

| Column Name | Classification | Description |
| :--- | :--- | :--- |
| `order_id` | **Dimension** | Unique transaction identifier (non-numeric key) |
| `clean_first_name` | **Dimension** | Standardized first name of the customer |
| `clean_last_name` | **Dimension** | Standardized last name of the customer |
| `item` | **Dimension** | Name/description of the product ordered |
| `category` | **Dimension** | Product category grouping (e.g., Electronics, Apparel) |
| `region` | **Dimension** | Sales territory/geographic area |
| `order_month` | **Dimension** | Text representation of order date (`YYYY-MM`) |
| `status` | **Dimension** | Order fulfillment status (e.g., completed, cancelled) |
| `unit_price` | **Measure** | Unit price of the individual item |
| `quantity` | **Measure** | Number of units ordered |
| `amount` | **Measure** | Total order amount |
| `revenue_calc` | **Measure** | Calculated revenue (`unit_price * quantity`) |
| `created_at` | **Dimension** | Date/timestamp of order creation |

---


KPI Cards

Total Revenue

Metric: SUM(amount)

Value: $692400

Confirmation: The value displayed on the Total Revenue KPI card ($692400) exactly matches the total_revenue calculated in Part A's q05.

Total Units Sold

Metric: SUM(quantity)

Value: 163