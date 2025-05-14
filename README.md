Inventory Management System
Description
The Inventory Management System is a MySQL-based relational database designed for businesses to track product stock levels, suppliers, customers, and order transactions. It ensures efficient inventory management while maintaining accurate records of product details, categories, and sales.
Technologies Used
- MySQL – Database Management System
- SQL – Structured Query Language
Setup Instructions
Prerequisites
- MySQL installed on your system
- A MySQL-compatible database management tool (e.g., MySQL Workbench)
Installation Steps
- Download the SQL file containing the schema (inventory_management.sql).
- Open MySQL Workbench or any preferred database tool.
- Create the database:
CREATE DATABASE InventoryDB;
- Select the database:
USE InventoryDB;
- Import the SQL file:
- Using MySQL Workbench:
- Navigate to File → Open SQL Script
- Select inventory_management.sql
- Execute the script
- Using Command Line:
mysql -u username -p InventoryDB < inventory_management.sql
- Verify the tables:
SHOW TABLES;

