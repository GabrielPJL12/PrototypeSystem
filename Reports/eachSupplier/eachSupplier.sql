spool Z:\Code\PrototypeSystem\eachSupplier.txt

-- CPSY 250 F, Database Design and Programming
-- Project Deliverable 5: Prototype System
-- Gabriel Leclerc
-- 2023 / 04 / 21

-- Report Description: 

-- SUPPLIER REPORT
-- Show all suppliers and the following summary information:
-- 1. For each supplier:
--   a) Total number of products
--   b) Total number of orders
--   c) Total value of all orders

-- SQL:


column "Name" format a20
column "Total Value" format a11
SELECT "Name", "Products", "Orders", "Total Value"
FROM (SELECT supplier_name "Name", COUNT(product_num) "Products"
    FROM t_supplier JOIN t_product USING (supplier_num) 
    GROUP BY supplier_name) 
JOIN (SELECT supplier_name "Name", COUNT(order_num) "Orders", TO_CHAR(SUM(final_price), '$9,990.00') "Total Value"
    FROM t_supplier JOIN t_product USING (supplier_num) JOIN t_order USING (product_num)
    GROUP BY supplier_name) 
    USING ("Name");
CLEAR columns

spool off
