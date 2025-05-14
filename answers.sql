-- Create the database for Inventory Management
CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Creating Categories Table
-- This table stores product categories such as "Electronics", "Furniture", etc.
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each category
    CategoryName VARCHAR(255) NOT NULL UNIQUE -- Category name must be unique
);

-- Creating Suppliers Table
-- Stores details of suppliers providing products
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each supplier
    SupplierName VARCHAR(255) NOT NULL, -- Supplier name
    ContactName VARCHAR(255), -- Contact person's name
    Phone VARCHAR(20), -- Supplier contact number
    Email VARCHAR(255) UNIQUE -- Email must be unique
);

-- Creating Products Table
-- Stores details of all available products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT, -- Unique product identifier
    ProductName VARCHAR(255) NOT NULL, -- Name of the product
    CategoryID INT, -- Category the product belongs to
    SupplierID INT, -- Supplier providing the product
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0), -- Price must be positive
    StockQuantity INT NOT NULL DEFAULT 0, -- Default stock is 0
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE SET NULL, -- Maintains category-product relationship
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE SET NULL -- Maintains supplier-product relationship
);

-- Creating Customers Table
-- Stores details of customers who place orders
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT, -- Unique customer identifier
    CustomerName VARCHAR(255) NOT NULL, -- Customer name
    Email VARCHAR(255) UNIQUE, -- Email must be unique for each customer
    Phone VARCHAR(20) -- Contact number
);

-- Creating Orders Table
-- Stores order transactions made by customers
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT, -- Unique order identifier
    CustomerID INT NOT NULL, -- Customer placing the order
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Captures order date/time automatically
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE -- Deletes orders if the customer is removed
);

-- Creating OrderDetails Table (Many-to-Many Relationship)
-- Stores details of products within each order
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for order details
    OrderID INT NOT NULL, -- Order associated with the product
    ProductID INT NOT NULL, -- Product included in the order
    Quantity INT NOT NULL CHECK (Quantity > 0), -- Ensures quantity is greater than 0
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE, -- Deletes order details if the order is removed
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE -- Deletes order details if the product is removed
);