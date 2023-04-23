CPSY 250 F, Database Design and Programming
Project Deliverable 5: Prototype System
Joseph Adam, Gabriel Leclerc, Benjamin Roskey
2023 / 04 / 23
-------------------
REPORTS
-------------------
REPORT DESCRIPTIONS:

Supplier:
This report shows values for the number of products, number of orders, and value of all orders for each suppliers as well as the total number of products, total number of orders, and total value of all orders for all suppliers.
The report makes use of:
1. Joins
2. Single Row Functions
3. Group Functions
4. Subqueries
5. SQL*PLUS Report Formatting Including:
  a) BREAK
  b) COMPUTE
  c) COLUMN

categorySearch:
This report accepts a category number using the ACCEPT keyword and returns all products that are part of that category, with their corresponding price.
The report makes use of:
1. ACCEPT Keyword

Order Details:
Output all the details on an order, including shipping and appropriate provincial and federal taxes, for AB only.
The report makes use of:
1. Restricting Rows and Sorting Data

-------------------
EQUIPMENT & MATERIALS:
1. Windows Computer with a minimum of 16GB RAM and 250GB of free disk space, capable of nested virtualization.
2. Access to Oracle Version 11g or better through SQL*PLUS.
3. An IDE capable of editing an .sql file.
-------------------
TO REVIEW:
1. Review the conceptual model pdf and the physical model pdf in the design folder
2. Review the README.txt in the build folder that explains how to create the tables.
3. Review the README.txt in the populate folder that explains how to populate the tables.
4. Review the README.txt in the verification folder that explains how to run the scripts to verify the tables.
-------------------
TO CREATE & POPULATE THE DATABASE:
1. Create the tables
2. Populate the tables.
3. Verify the tables.
-------------------
TO RUN THE SCRIPT:
1. Edit the path on line 1 of eachSupplier.sql in the eachSupplier folder to the desired path of the spool file (do this using an IDE).
2. Run the eachSupplier.sql script using Oracle Version 11g or better through SQL*PLUS.
  a) This will generate a spool file at the desired path.
-------------------
INCLUDED IN EACH REPORT:
1. A script.
2. A spool file showing a sample run of the report.
3. One README.txt file explaining how to generate the report.

