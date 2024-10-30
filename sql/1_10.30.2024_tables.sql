CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

CREATE TABLE Deals (
    DealID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    UserID INT REFERENCES Users(UserID),
    DealDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    StatusID INT REFERENCES DealStatuses(StatusID)
);

CREATE TABLE Deals_Products (
    DealID INT REFERENCES Deals(DealID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (DealID, ProductID)
);

CREATE TABLE Suppliers (
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Suppliers_Products (
    SupplierID INT REFERENCES Suppliers(SupplierID),
    ProductID INT REFERENCES Products(ProductID),
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (SupplierID, ProductID)
);

CREATE TABLE Promotions (
    PromotionID SERIAL PRIMARY KEY,
    PromotionName VARCHAR(100) NOT NULL,
    Description TEXT,
    DiscountPercentage DECIMAL(5, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

CREATE TABLE DealStatuses (
    StatusID SERIAL PRIMARY KEY,
    StatusName VARCHAR(50) NOT NULL
);

CREATE TABLE OrdersToSuppliers (
    OrderID SERIAL PRIMARY KEY,
    SupplierID INT REFERENCES Suppliers(SupplierID),
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL
);

CREATE TABLE OrdersToSuppliers_Products (
    OrderID INT REFERENCES OrdersToSuppliers(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);

CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Products_Categories (
    ProductID INT REFERENCES Products(ProductID),
    CategoryID INT REFERENCES Categories(CategoryID),
    PRIMARY KEY (ProductID, CategoryID)
);
