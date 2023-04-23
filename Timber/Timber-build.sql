--Build Script for Project Deliverable 4
set echo on
set linesize 100
set pagesize 66
spool C:\CPRG250s\.BuildScript.txt

--drop tables, child tables followed by parent tables
--MEGA children
drop table t_review cascade constraints;
drop table t_product_order cascade constraints;
--children
drop table t_sub_category cascade constraints;
drop table t_order cascade constraints;
drop table t_product cascade constraints;

--parents
drop table t_customer cascade constraints;
drop table t_category cascade constraints;
drop table t_supplier cascade constraints;

--create tables, parent tables followed by child tables
--Parents
create table t_supplier
(
    supplier_num number constraint sys_t_supplier_num_pk primary key,
    supplier_name varchar2(50) not null,
    available_product_qty number not null constraint sys_t_supplier_available_prod_qty_ck
        CHECK (available_product_qty >= 0),
    est_days_for_delivery number not null constraint sys_t_supplier_est_deliver_ck
        check (est_days_for_delivery >= 0),
    supplier_email varchar2(50) constraint sys_t_supplier_email_uk unique,   
    supplier_prov varchar2(50) not null,
    supplier_city varchar2(50) not null
);

create table t_category
(
    parent_category_num number constraint sys_t_category_parent_num_pk primary key,
    category_name varchar2(50) not null
);

create table t_customer
(
    customer_num number constraint sys_t_customer_num_pk primary key,
    customer_address varchar2(100) not null,
    cust_prov varchar2(2) not null constraint sys_t_customer_prov_ck
        check (cust_prov in ('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU')),
    cust_city varchar2(50) not null,
    cust_postal_code varchar2(6) not null constraint sys_t_customer_pc_ck
        check (regexp_like(cust_postal_code, '[A-Z][0-9][A-Z][0-9][A-Z][0-9]')),
    cust_phone_num varchar2(12) not null constraint sys_t_customer_phone_ck
        check (regexp_like(cust_phone_num, '[0-9]{3}\.[0-9]{3}\.[0-9]{4}')),
    cust_email varchar2(50) not null constraint sys_t_customer_email_uk unique,
    is_member char(1) constraint sys_t_customer_member_ck
        check (is_member in (1,0))
);

--Children
create table t_product
(
    product_num number constraint sys_t_product_num_pk primary key,
    parent_category_num number  not null constraint sys_t_product_par_cat_num_fk
        references t_category(parent_category_num),
    supplier_num number constraint sys_t_product_supp_num_fk
        references t_supplier(supplier_num),
    prod_title varchar2(100),
    prod_description varchar2(100),
    prod_price number(8,2) not null constraint sys_t_product_price_ck
        check (prod_price > 0),
    prod_weight_kg number(5,2) not null constraint sys_t_product_weight_ck
        check (prod_weight_kg > 0),
    prod_tax_exempt char(1) not null constraint sys_t_product_exempt_ck
        check (prod_tax_exempt in (1,0))
);

create table t_order
(
    order_num number constraint sys_t_order_num_pk primary key,
    customer_num number not null constraint sys_t_order_cust_num_fk
        references t_customer (customer_num),
    product_num number not null constraint sys_t_order_prod_num_fk
        references t_product (product_num),
    order_date date,
    est_deliver_date date not null constraint sys_t_order_deli_date_ck
        check (regexp_like(est_deliver_date, '[0-9]{2}\-[A-Z]{3}\-[0-9]{2}')),
    final_price number(8,2) not null,
    shipping_cost number(4,2) not null constraint sys_t_order_ship_cost_ck
        check (shipping_cost >= 0),        
    tax_cost number not null constraint sys_t_order_tax_cost_ck
        check (tax_cost >= 0),
    shipping_prov char(2) not null constraint sys_t_order_ship_prov_ck
        check (shipping_prov in ('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'))
);

create table t_sub_category
(
    sub_category_num number constraint sys_t_sub_category_sub_num_pk primary key,
    parent_category_num number not null constraint sys_t_sub_category_par_cat_num_fk
        references t_category(parent_category_num),
    sub_category_name varchar2(50) not null
);

--MEGA Children
create table t_product_order
(
    order_num number,
    product_num number,
    constraint sys_t_product_order_num_pk primary key (order_num, product_num),
    constraint sys_t_product_order_num_fk foreign key (order_num)
        references t_order (order_num),
    constraint sys_t_product_num_fk foreign key (product_num)
        references t_product (product_num)
);

create table t_review
(
    review_num number constraint sys_t_review_num_pk primary key,
    review_customer_num number not null constraint sys_t_review_cust_num_fk
        references t_customer (customer_num),
    review_product_num number not null constraint sys_t_review_prod_num_fk
        references t_product (product_num),    
    review_price number not null constraint sys_t_review_price_ck 
        check (review_price > 0),
    review_weight number(5,2) not null constraint sys_t_review_weight_ck
        check (review_weight > 0),
    review_tax_exempt char(1) not null constraint sys_t_review_exempt_ck
        check (review_tax_exempt in (1,0)),
    review_rating number(1) constraint sys_t_review_rating_ck
        check (regexp_like(review_rating,'[0-5]{1}')),
    review_comments varchar2(200),
    date_created date not null
);

spool off