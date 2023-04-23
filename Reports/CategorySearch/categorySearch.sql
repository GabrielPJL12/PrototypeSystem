set echo off 
set verify off

spool Z:\PrototypeSystem\Reports\CategorySearch\categorySearch.txt

PROMPT == Parent Categories ==
PROMPT 1 - Toiletries
PROMPT 2 - Alcohol and Drugs
PROMPT 3 - Food
PROMPT 4 - Technology
PROMPT 5 - Music
PROMPT 6 - Fitness
PROMPT 7 - Education
PROMPT 
PROMPT Enter desired category number:
ACCEPT parent_category_num NUMBER DEFAULT 001

column "Products" format a40
SELECT prod_title "Products", TO_CHAR(prod_price, '$9,990.00') "Price"
FROM t_product
WHERE parent_category_num = '&parent_category_num.';
CLEAR columns

spool off
