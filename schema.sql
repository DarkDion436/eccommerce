-- Bella Beauty Database Schema
-- This script creates the tables for the e-commerce site.
-- It is designed to be compatible with PostgreSQL and MySQL.

-- 1. Users Table: Stores customer information.
CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    shipping_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Categories Table: Manages product categories.
CREATE TABLE Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 3. Products Table: The central table for all items.
CREATE TABLE Products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(2048),
    stock_quantity INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- 4. Product_Details Table: Stores flexible, product-specific attributes.
CREATE TABLE Product_Details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    attribute_name VARCHAR(100) NOT NULL, -- e.g., 'Skin Type', 'Scent Profile', 'Color'
    attribute_value VARCHAR(255) NOT NULL, -- e.g., 'Oily, Combination', 'Floral', 'Ruby Red'
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE
);

-- 5. Orders Table: High-level information about each purchase.
CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending', -- e.g., 'Pending', 'Shipped', 'Delivered', 'Cancelled'
    shipping_address TEXT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- 6. Order_Items Table: Links products to orders.
CREATE TABLE Order_Items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL, -- Price at the time of purchase
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- 7. Reviews Table: Stores customer reviews and ratings.
CREATE TABLE Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Add indexes for frequently queried columns to improve performance
CREATE INDEX idx_products_category_id ON Products(category_id);
CREATE INDEX idx_product_details_product_id ON Product_Details(product_id);
CREATE INDEX idx_orders_user_id ON Orders(user_id);
CREATE INDEX idx_reviews_product_id ON Reviews(product_id);

-- Note: For MySQL, replace `INT PRIMARY KEY AUTO_INCREMENT` as needed if using older versions.
-- For PostgreSQL, `SERIAL PRIMARY KEY` is a common equivalent for auto-incrementing integers.