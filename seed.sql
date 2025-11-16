-- Bella Beauty Database Seeder
-- This script inserts sample data into the tables.

-- 1. Insert Categories
INSERT INTO Categories (name, slug, description) VALUES
('Skincare', 'skincare', 'Products for nurturing and protecting your skin.'),
('Makeup', 'makeup', 'Cosmetics to enhance your natural beauty.'),
('Fragrance', 'fragrance', 'A collection of exquisite scents and perfumes.'),
('Haircare', 'haircare', 'Everything you need for healthy, beautiful hair.');

-- 2. Insert Products (using category IDs from above)
-- Note: Category IDs are assumed to be 1:Skincare, 2:Makeup, 3:Fragrance, 4:Haircare

-- Skincare Products
INSERT INTO Products (category_id, title, description, price, image_url, stock_quantity) VALUES
(1, 'Radiance Vitamin C Serum', 'Brightening & Anti-aging serum with 20% Vitamin C', 68.00, 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=1887&auto=format&fit=crop', 100),
(1, 'Hyaluronic Acid Serum', 'Multi-weight hyaluronic acid for deep hydration', 54.00, 'https://images.unsplash.com/photo-1656424308811-7c31511b9baa?q=80&w=1887&auto=format&fit=crop', 150),
(1, 'Gentle Foaming Cleanser', 'Soft, gentle foam cleanses without stripping', 28.00, 'https://images.unsplash.com/photo-1570554886111-e80b8c7d5b8d?q=80&w=1887&auto=format&fit=crop', 200);

-- Makeup Products
INSERT INTO Products (category_id, title, description, price, image_url, stock_quantity) VALUES
(2, 'Natural Finish Foundation', 'Buildable coverage with natural finish', 36.00, 'https://images.unsplash.com/photo-1585386959984-a415522e3d29?q=80&w=1887&auto=format&fit=crop', 120),
(2, 'Velvet Matte Lipstick', 'Rich, creamy matte lipstick in ''Ruby Red''', 24.00, 'https://images.unsplash.com/photo-1590155289999-69fd3d2c7a4a?q=80&w=1887&auto=format&fit=crop', 300);

-- Fragrance Products
INSERT INTO Products (category_id, title, description, price, image_url, stock_quantity) VALUES
(3, 'Rose Garden Eau de Parfum', 'Elegant blend of rose, jasmine, and amber', 120.00, 'https://images.unsplash.com/photo-1592914610354-fd354ea45e48?q=80&w=1890&auto=format&fit=crop', 80),
(3, 'Midnight Sandalwood', 'Warm, mysterious scent of sandalwood and cedar', 135.00, 'https://images.unsplash.com/photo-1585399102219-b8d5317f6b83?q=80&w=1887&auto=format&fit=crop', 60);

-- Haircare Products
INSERT INTO Products (category_id, title, description, price, image_url, stock_quantity) VALUES
(4, 'Luxe Hair Oil', 'Nourishing oil blend for silky smooth hair', 42.00, 'https://images.unsplash.com/photo-1585232004423-244e0e6904e3?q=80&w=1887&auto=format&fit=crop', 90),
(4, 'Hydrating Argan Shampoo', 'Sulfate-free shampoo to gently cleanse and hydrate', 32.00, 'https://images.unsplash.com/photo-1599387737838-66a342198256?q=80&w=1887&auto=format&fit=crop', 180);

-- 3. Insert Product Details
-- Note: Product IDs are assumed to be sequential from 1.

-- Details for 'Radiance Vitamin C Serum' (Product ID: 1)
INSERT INTO Product_Details (product_id, attribute_name, attribute_value) VALUES
(1, 'Skin Type', 'All except very sensitive'),
(1, 'When to Use', 'AM');

-- Details for 'Hyaluronic Acid Serum' (Product ID: 2)
INSERT INTO Product_Details (product_id, attribute_name, attribute_value) VALUES
(2, 'Skin Type', 'All Skin Types'),
(2, 'When to Use', 'AM/PM');

-- Details for 'Rose Garden Eau de Parfum' (Product ID: 6)
INSERT INTO Product_Details (product_id, attribute_name, attribute_value) VALUES
(6, 'Scent Profile', 'Floral, Amber'),
(6, 'Best For', 'Day & Evening Wear');

-- Details for 'Luxe Hair Oil' (Product ID: 8)
INSERT INTO Product_Details (product_id, attribute_name, attribute_value) VALUES
(8, 'Hair Type', 'All Hair Types, especially dry or frizzy'),
(8, 'How to Use', 'Apply a few drops to damp or dry hair.');

-- 4. Insert Sample Users and Reviews
INSERT INTO Users (full_name, email, password_hash) VALUES
('Emma S.', 'emma.s@example.com', 'hashed_password_placeholder'),
('Sophie M.', 'sophie.m@example.com', 'hashed_password_placeholder');

INSERT INTO Reviews (product_id, user_id, rating, comment) VALUES
(1, 1, 5, 'The Vitamin C Serum has completely transformed my skin. My complexion is brighter and more radiant than ever!'),
(6, 2, 5, 'The Rose Garden perfume is divine! I receive compliments every time I wear it. Simply luxurious!');