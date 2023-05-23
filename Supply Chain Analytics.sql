-- Aggregating the files:
SELECT
    o.order_id,
    c.customer_id,
	c.customer_name,
    c.city,
	RIGHT(p.product_name, LENGTH(p.product_name) - 3) as product_name,
    p.category as product_category,
    o.order_placement_date,
    o.agreed_delivery_date,
    o.actual_delivery_date,
    o.order_qty,
    o.delivery_qty,
	o.InFull as actual_if,
    o.OnTime as actual_ot,
    o.OTIF as actual_otif
FROM
customers c
JOIN 
order_lines o
ON c.customer_id = o.customer_id
JOIN
products p
ON p.product_id = o.product_id
ORDER BY o.order_id;

-- Formatting the targets:
SELECT 
	customer_id,
    `ontime_target%` / 100 AS target_ot,
    `infull_target%` / 100 AS target_if,
    `otif_target%` / 100 AS target_otif
FROM targets_orders;


