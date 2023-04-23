--Populate Script for Project Deliverable 4
set echo on
spool Z:\PrototypeSystem\PopulateScript\populateScript.txt

--delete existing data, children followed by parents

delete t_review;
delete t_product_order;
delete t_sub_category;
delete t_order;
delete t_product;
delete t_customer;
delete t_category;
delete t_supplier;

--insert data, parents followed by children

--Parents
--3 suppliers min
insert into t_supplier (supplier_num, supplier_name, available_product_qty, est_days_for_delivery, supplier_email, supplier_prov, supplier_city)
    values(00826, 'Proctor and Gamble', 1000, 1, 'pg@help.com', 'BC', 'Vancouver');
insert into t_supplier (supplier_num, supplier_name, available_product_qty, est_days_for_delivery, supplier_email, supplier_prov, supplier_city)
    values(57283, 'Dairy Distillery', 542, 4, 'info@dairydistillery.com', 'ON', 'Almonte');
insert into t_supplier (supplier_num, supplier_name, available_product_qty, est_days_for_delivery, supplier_email, supplier_prov, supplier_city)
    values(12345, 'My Daily Brett', 300, 5, 'INFO@OURDAILYBRETT.COM', 'AB', 'Calgary');
insert into t_supplier (supplier_num, supplier_name, available_product_qty, est_days_for_delivery, supplier_email, supplier_prov, supplier_city)
    values(62385, 'CDW', 10000, 7, 'cdw@cdwcanada.com', 'QC', 'Montreal');
insert into t_supplier (supplier_num, supplier_name, available_product_qty, est_days_for_delivery, supplier_email, supplier_prov, supplier_city)
    values(987654, 'Fitness Ltd.', 500, 7, 'fitness@fitnessltd.com', 'NT', 'Yellowknife');
insert into t_supplier (supplier_num, supplier_name, available_product_qty, est_days_for_delivery, supplier_email, supplier_prov, supplier_city)
    values(99999, 'MTV', 10000, 5, 'mtv@mtvmusic.com', 'SK', 'Regina');


--7 products min
insert into t_category (parent_category_num, category_name)
    values(001, 'Toiletries');
insert into t_category (parent_category_num, category_name)
    values(002, 'Alcohol and Drugs');
insert into t_category (parent_category_num, category_name)
    values(003, 'Food');
insert into t_category (parent_category_num, category_name)
    values(004, 'Technology');
insert into t_category (parent_category_num, category_name)
    values(005, 'Music');
insert into t_category (parent_category_num, category_name)
    values(006, 'Fitness');
insert into t_category (parent_category_num, category_name)
    values(007, 'Education');

--5 customers min. some with orders, some without. customers should be from 3 different provinces
insert into t_customer (customer_num, customer_address, cust_prov, cust_city, cust_postal_code, cust_phone_num, cust_email, is_member)
    values(1, '123 17th Ave SW', 'AB', 'Calgary', 'T2S0Y4', '403.555.6666', 'connor@gmail.com', 1);
insert into t_customer (customer_num, customer_address, cust_prov, cust_city, cust_postal_code, cust_phone_num, cust_email, is_member)
    values(2, '33 Hawthorne Street', 'NS', 'Antigonish', 'B2G1A2', '902.768.4552', 'PeterH@gmail.com', 0);
insert into t_customer (customer_num, customer_address, cust_prov, cust_city, cust_postal_code, cust_phone_num, cust_email, is_member)
    values(3, '777 Pacific Blvd', 'BC', 'Vancouver', 'V6B4Y8', '604.669.2300', 'bcplace@bcplace.com', 0);
insert into t_customer (customer_num, customer_address, cust_prov, cust_city, cust_postal_code, cust_phone_num, cust_email, is_member)
    values(4, '555 Saddledome Rise SE', 'AB', 'Calgary', 'T2G2W1', '403.777.4646', 'dome@dome.com', 1);
insert into t_customer (customer_num, customer_address, cust_prov, cust_city, cust_postal_code, cust_phone_num, cust_email, is_member)
    values(5, '1301 16 Ave NW', 'AB', 'Calgary', 'T2M0L4', '403.284.7248', 'internation@sait.ca', 1);

--Children
--7 Products min
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(10073010711355, 001, 00826, 'Tampax Pearl Regular Plastic Tampons', 'Your flow is different everyday. Your tampon should be, too.', 12.94, 0.1, 1);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(4552, 002, 57283, 'VODKOW VODKA', 'We have combined unused milk with vodka into a spirit!', 32.95, 0.75, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(2300, 003, 12345, 'Catering Event', 'Min spend $100. Let us do the work!', 100, 10, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(7248, 004, 62385, 'Samsung Monitor', 'Samsung  S32A804NMN - LED monitor - 4K - 32', 551.99, 7, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(4646, 006, 987654, 'Dumbbell Rack', 'Storage system that allows one to store both dumbbells and kettlebells.', 673.00, 80, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(456, 005, 99999, 'Speaker', 'To really turn the party up to 11. Free shipping with members!', 1500, 30, 0 );
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(666, 007, 62385, 'Online Learning', 'Learn C# through CDW!', 100, 0.1, 1);

insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(10073010711356, 001, 00826, 'Pads', 'By: PadMakers', 50.97, 0.1, 1);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(4553, 002, 57283, 'VODKOW MILK', 'We have combined unused milk with used milk into a milk!', 31.95, 0.75, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(2301, 003, 12345, 'Catering Chef', 'Min spend $200. Let us do the work!', 200, 10, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(7249, 004, 62385, 'Samsung Remote', 'Samsung  S32A804NMN - LED monitor remote', 25.99, 7, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(4647, 006, 987654, 'Dumbbell', 'Dumbbells for weight lifting', 200.00, 80, 0);
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(457, 005, 99999, 'Speaker holder', 'To really turn the party up to 12. Free shipping with members!', 150, 30, 0 );
insert into t_product (product_num, parent_category_num, supplier_num, prod_title, prod_description, prod_price, prod_weight_kg, prod_tax_exempt) 
    values(667, 007, 62385, 'Online Learning', 'Learn Python through the web!', 100, 0.1, 1);

--6 orders min
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(0045, 1, 10073010711355, '20-Feb-23', '21-Feb-23', 12.94, 0, 0, 'AB');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(902, 2, 4552, '24-Feb-23', '28-Feb-23', 64.82, 21.92, 9.95, 'NS');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(604, 3, 2300, '01-Jan-23', '02-Feb-23', 1129.97, 79.97, 50, 'BC');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(403, 5, 7248, '01-May-20', '08-May-20', 1309.53, 39.95, 165.60, 'AB');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(777, 4, 4646, '06-June-19', '15-Jun-19', 780.56, 79.97, 27.59, 'NL');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(123, 1, 456, '07-Jul-21', '08-Jul-21', 1725, 0, 225 , 'PE');

insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(0046, 1, 10073010711355, '20-Feb-23', '21-Feb-23', 12.94, 0, 0, 'AB');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(903, 2, 4552, '24-Feb-23', '28-Feb-23', 64.82, 21.92, 9.95, 'NS');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(605, 3, 2300, '01-Jan-23', '02-Feb-23', 1129.97, 79.97, 50, 'BC');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(404, 5, 7248, '01-May-20', '08-May-20', 1309.53, 39.95, 165.60, 'AB');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(778, 4, 4646, '06-June-19', '15-Jun-19', 780.56, 79.97, 27.59, 'NL');
insert into t_order (order_num, customer_num, product_num, order_date, est_deliver_date, final_price, shipping_cost, tax_cost, shipping_prov) 
    values(124, 1, 456, '07-Jul-21', '08-Jul-21', 1725, 0, 225 , 'PE');

insert into t_sub_category (sub_category_num, parent_category_num, sub_category_name) 
    values(0011, 001, 'Tampons');
insert into t_sub_category (sub_category_num, parent_category_num, sub_category_name) 
    values(0022, 002, 'Spirits');
insert into t_sub_category (sub_category_num, parent_category_num, sub_category_name) 
    values(0033, 003, 'Catering');
insert into t_sub_category (sub_category_num, parent_category_num, sub_category_name) 
    values(0044, 004, 'Monitors');
insert into t_sub_category (sub_category_num, parent_category_num, sub_category_name) 
    values(0066, 006, 'Weightlifting Equipment');
insert into t_sub_category (sub_category_num, parent_category_num, sub_category_name) 
    values(0055, 005, 'Speakers');
insert into t_sub_category (sub_category_num, parent_category_num, sub_category_name) 
    values(0077, 007, 'Distance Learning');

--MEGA Children
--6 orders min
insert into t_product_order (order_num, product_num) 
    values(0045, 10073010711355);
insert into t_product_order (order_num, product_num) 
    values(902, 4552);
insert into t_product_order (order_num, product_num) 
    values(604, 2300);
insert into t_product_order (order_num, product_num) 
    values(403, 7248);
insert into t_product_order (order_num, product_num) 
    values(777, 4646);
insert into t_product_order (order_num, product_num) 
    values(123, 456);

--5 review min
insert into t_review (review_num, review_customer_num, review_product_num, review_price, review_weight, review_tax_exempt, review_rating, review_comments, date_created) 
    values(111, 1, 10073010711355, 12.98, 0.1, 1, 4, 'No complaints from the wife.', '28-Feb-23');
insert into t_review (review_num, review_customer_num, review_product_num, review_price, review_weight, review_tax_exempt, review_rating, review_comments, date_created) 
    values(222, 2, 4552, 64.82, 3.5, 0, 3, 'Orderd 5. Just Ok. Has an Ouzo taste.', '05-Jun-21');
insert into t_review (review_num, review_customer_num, review_product_num, review_price, review_weight, review_tax_exempt, review_rating, review_comments, date_created) 
    values(333, 3, 2300, 1129.97, 90, 0, 5, 'Fantastic! Did not have to worry about anything from shipping or cooking!', '15-Feb-23');
insert into t_review (review_num, review_customer_num, review_product_num, review_price, review_weight, review_tax_exempt, review_rating, review_comments, date_created) 
    values(555, 5, 7248, 1309.53, 14, 0, 4, 'Minor Scratches on Stand. Monitor works excellent though.', '25-May-20');
insert into t_review (review_num, review_customer_num, review_product_num, review_price, review_weight, review_tax_exempt, review_rating, review_comments, date_created) 
    values(444, 4, 4646, 780.56, 80, 0, 5, 'Easy to put together, very sturdy.', '17-Jul-21');

--verify that the inserts worked
select * from t_supplier;
select * from t_category;
select * from t_customer;
select * from t_order;
select * from t_product;
select * from t_sub_category;
select * from t_product_order;
select * from t_review;

commit;
spool off 
