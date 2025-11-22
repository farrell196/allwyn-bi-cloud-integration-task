-- SQL transformation script
-- Cleans null values and standardises date format for reporting

CREATE OR REPLACE TABLE cleaned_orders AS
SELECT
    order_id,
    customer_id,
    TRY_CAST(order_date AS DATE) AS order_date,
    amount
FROM raw_orders
WHERE order_id IS NOT NULL
  AND customer_id IS NOT NULL;

