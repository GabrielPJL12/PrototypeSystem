set echo off
set linesize 200
set pagesize 100
spool C:\CPRG250s\PD5_PrototypeSystem\Reports\ReportByBR\OrderDetails.txt
--Project Scenario 2C for PD5

-- Output all the details on an order, including shipping and appropriate provincial and federal taxes 
-- for AB and BC only, this will implement the where clause / Restricting Rows and Sorting Data
column "Shipping Province" format a18
column "Est. Delivery Date" format a20
SELECT order_num "Order Number", customer_num "Customer Number", product_num "Product Number", order_date "Order Date", est_deliver_date "Est. Delivery Date", final_price "Final Price", shipping_cost "Shipping Cost", tax_cost "Tax Cost", shipping_prov "Shipping Province"
FROM t_order
WHERE shipping_prov = 'AB';
clear columns

spool off
