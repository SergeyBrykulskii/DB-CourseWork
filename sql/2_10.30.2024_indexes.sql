CREATE INDEX idx_users_email ON Users (Email);

CREATE INDEX idx_customers_email ON Customers (Email);

CREATE INDEX idx_products_name ON Products (ProductName);

CREATE INDEX idx_deals_customer ON Deals (CustomerID);
CREATE INDEX idx_deals_user ON Deals (UserID);
CREATE INDEX idx_deals_status ON Deals (StatusID);

CREATE INDEX idx_deals_products_deal ON Deals_Products (DealID);
CREATE INDEX idx_deals_products_product ON Deals_Products (ProductID);

CREATE INDEX idx_suppliers_email ON Suppliers (Email);

CREATE INDEX idx_suppliers_products_supplier ON Suppliers_Products (SupplierID);
CREATE INDEX idx_suppliers_products_product ON Suppliers_Products (ProductID);

CREATE INDEX idx_promotions_name ON Promotions (PromotionName);

CREATE INDEX idx_orders_to_suppliers_supplier ON OrdersToSuppliers (SupplierID);

CREATE INDEX idx_orders_to_suppliers_products_order ON OrdersToSuppliers_Products (OrderID);
CREATE INDEX idx_orders_to_suppliers_products_product ON OrdersToSuppliers_Products (ProductID);

CREATE INDEX idx_categories_name ON Categories (CategoryName);

CREATE INDEX idx_products_categories_product ON Products_Categories (ProductID);
CREATE INDEX idx_products_categories_category ON Products_Categories (CategoryID);
