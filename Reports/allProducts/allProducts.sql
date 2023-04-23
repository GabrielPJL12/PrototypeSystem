SET linesize 250
SET pagesize 25
SET feedback off
SET echo OFF
spool C:\CPRG250s\PrototypeGithub\PrototypeSystem_1\Reports\allProducts\allProducts.txt

column "All Products" format a50
COLUMN DUMMY NOPRINT
COMPUTE SUM OF prod_price ON DUMMY
BREAK ON DUMMY
TTITLE CENTER 'All Products Available'
BTITLE CENTER "Group 6"
SELECT NULL DUMMY, prod_title, prod_description, prod_price
FROM t_product
WHERE prod_price >= 1
ORDER BY prod_title;
clear columns

spool OFF