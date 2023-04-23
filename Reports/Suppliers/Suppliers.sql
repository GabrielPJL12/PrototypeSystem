set echo off 
spool Z:\PrototypeSystem\Reports\Suppliers\Suppliers.txt

column "Name" format a20
COLUMN DUMMY NOPRINT
COMPUTE SUM OF "Products" ON DUMMY
COMPUTE SUM OF "Orders" ON DUMMY
COMPUTE SUM OF "Value ($)" ON DUMMY
BREAK ON DUMMY
SELECT NULL DUMMY, "Name", "Products", "Orders", "Value ($)"
FROM (SELECT supplier_name "Name", COUNT(product_num) "Products"
    FROM t_supplier JOIN t_product USING (supplier_num) 
    GROUP BY supplier_name) 
JOIN (SELECT supplier_name "Name", COUNT(order_num) "Orders", SUM(final_price) "Value ($)"
    FROM t_supplier JOIN t_product USING (supplier_num) JOIN t_order USING (product_num)
    GROUP BY supplier_name) 
    USING ("Name");
CLEAR columns

spool off
