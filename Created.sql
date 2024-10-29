USE master;
DROP DATABASE IF EXISTS warehouse_management;
CREATE DATABASE warehouse_management;

USE warehouse_management;

DROP TABLE IF EXISTS Export_Detail;
DROP TABLE IF EXISTS Import_Detail;
DROP TABLE IF EXISTS Export_History;
DROP TABLE IF EXISTS Import_History;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
    Categorie_id INT PRIMARY KEY IDENTITY(1,1),
    Categorie_Name NVARCHAR(100) NOT NULL,
    Description TEXT
);

CREATE TABLE Supplier (
    Supplier_id INT PRIMARY KEY IDENTITY(1,1),
    Supplier_name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY IDENTITY(1,1),
    Customer_name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Product (
    Product_id INT PRIMARY KEY IDENTITY(1,1),
    Product_Name NVARCHAR(100) NOT NULL,
    Unit NVARCHAR(50) NOT NULL DEFAULT N'Chiếc',
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    Price_Import FLOAT NOT NULL CHECK (Price_Import > 0),
    Price_Export FLOAT NOT NULL CHECK (Price_Export > 0),
    Origin NVARCHAR(100),
    Categorie_id INT NOT NULL,
    FOREIGN KEY (Categorie_id) REFERENCES Categories(Categorie_id)
);

CREATE TABLE Department (
    Dep_id INT PRIMARY KEY IDENTITY(1,1),
    Dep_Name NVARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Address NVARCHAR(200) NOT NULL,
    Manager_id INT
);

CREATE TABLE Employee (
    Employee_id INT PRIMARY KEY IDENTITY(1,1),
    Employee_name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    Gender VARCHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),
    Position NVARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Department_id INT NOT NULL,
    FOREIGN KEY (Department_id) REFERENCES Department(Dep_id)
);

ALTER TABLE Department 
ADD CONSTRAINT FK_Manager FOREIGN KEY (Manager_id) REFERENCES Employee(Employee_id);

CREATE TABLE Import_History (
    Imp_id INT PRIMARY KEY IDENTITY(1,1),
    Date_import DATE NOT NULL CHECK (Date_import <= GETDATE()),
    Employee_id INT NOT NULL,
    Supplier_id INT NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
    FOREIGN KEY (Supplier_id) REFERENCES Supplier(Supplier_id)
);

CREATE TABLE Export_History (
    Exp_id INT PRIMARY KEY IDENTITY(1,1),
    Date_Export DATE NOT NULL CHECK (Date_Export <= GETDATE()),
    Employee_id INT NOT NULL,
    Customer_id INT NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Import_Detail(
    ImpDT_id INT PRIMARY KEY IDENTITY(1,1),
    Price_Import FLOAT NOT NULL CHECK (Price_Import > 0),
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    Imp_id INT NOT NULL,
    Product_id INT NOT NULL,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    FOREIGN KEY (Imp_id) REFERENCES Import_History(Imp_id)
);

CREATE TABLE Export_Detail(
    ExpDT_id INT PRIMARY KEY IDENTITY(1,1),
    Price_Export FLOAT NOT NULL CHECK (Price_Export > 0),
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    Exp_id INT NOT NULL,
    Product_id INT NOT NULL,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    FOREIGN KEY (Exp_id) REFERENCES Export_History(Exp_id)
);
