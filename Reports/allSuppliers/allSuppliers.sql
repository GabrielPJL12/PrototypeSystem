spool Z:\Code\PrototypeSystem\allSuppliers.txt

column "Value of Orders" format a15
SELECT SUM("Total Products") "All Products", SUM("Orders") "All Orders", TO_CHAR(SUM("Total Value"), '$999,990.00') "Value of Orders"
FROM (SELECT supplier_name "Name", COUNT(product_num) "Total Products"
    FROM t_supplier JOIN t_product USING (supplier_num) 
    GROUP BY supplier_name) 
JOIN (SELECT supplier_name "Name", COUNT(order_num) "Orders", SUM(final_price) "Total Value"
    FROM t_supplier JOIN t_product USING (supplier_num) JOIN t_order USING (product_num)
    GROUP BY supplier_name) 
    USING ("Name");
CLEAR columns

spool off
