-- Sample Data Script for alumka.sqlite
-- Adding realistic data to make your app actually useful instead of sad and empty

-- More Users (because who doesn't need friends in their database?)
INSERT INTO users (username, password) VALUES 
    ('manager', 'totally_secure_hash_bro'),
    ('cashier1', 'password123_lmao'),
    ('warehouse', 'i_lift_things'),
    ('boss', 'show_me_the_money');

-- Categories (expanding beyond the basics)
INSERT INTO category (category_name) VALUES 
    ('Building Materials'),
    ('Plumbing Supplies'),
    ('Electrical'),
    ('Hardware'),
    ('Tools'),
    ('Paint'),
    ('Automotive'),
    ('Garden');

-- More Units (because measuring stuff is important)
INSERT INTO units (name, conversion_rate_to_base_unit) VALUES 
    ('kg', 1),
    ('gram', 0.001),
    ('liter', 1),
    ('ml', 0.001),
    ('dozen', 12),
    ('pair', 2),
    ('pack', 1),
    ('set', 1);

-- Items (the stuff you're actually selling)
INSERT INTO items (name, category_id, unit_id, stock, base_price, selling_price) VALUES 
    -- Building Materials
    ('Portland Cement', 4, 1, 50, 50000, 60000),
    ('Red Brick', 4, 1, 1000, 1500, 2000),
    ('Sand (Fine)', 4, 5, 20, 180000, 200000),
    ('Gravel', 4, 5, 15, 210000, 250000),
    
    -- Plumbing
    ('PVC Pipe 1/2"', 5, 5, 100, 15000, 18000),
    ('PVC Elbow Joint 1/2"', 5, 1, 200, 2000, 3000),
    ('Bathroom Faucet', 5, 1, 10, 85000, 120000),
    ('Kitchen Sink', 5, 1, 5, 350000, 450000),
    
    -- Electrical
    ('LED Bulb 5W', 6, 1, 50, 12000, 18000),
    ('Electrical Tape', 6, 3, 30, 5000, 8000),
    ('Extension Cord 5m', 6, 1, 15, 35000, 50000),
    ('Ceiling Fan', 6, 1, 8, 250000, 350000),
    
    -- Hardware
    ('Common Nails 2"', 7, 5, 30, 18000, 25000),
    ('Wood Screws Assorted', 7, 8, 20, 32000, 45000),
    ('Padlock', 7, 1, 25, 30000, 40000),
    ('Door Hinge', 7, 6, 40, 15000, 22000),
    
    -- Tools
    ('Claw Hammer', 8, 1, 10, 45000, 65000),
    ('Screwdriver Set', 8, 8, 8, 85000, 120000),
    ('Measuring Tape 5m', 8, 1, 15, 25000, 35000),
    ('Hand Saw', 8, 1, 10, 60000, 85000),
    
    -- Paint
    ('Interior White Paint', 9, 3, 25, 85000, 115000),
    ('Exterior Weatherproof Paint', 9, 3, 15, 120000, 165000),
    ('Paint Brush Set', 9, 8, 20, 35000, 50000),
    ('Paint Roller', 9, 1, 15, 28000, 40000);

-- Customers (people who give you money)
INSERT INTO customers (name, phone, address, note) VALUES
    ('Sarah Johnson', '555-1001', '123 Main St, Anytown', 'Regular customer, buys in bulk'),
    ('Mikes Construction', '555-2002', '456 Industry Ave, Businessville', 'Commercial account - NET 30'),
    ('DIY Home Projects', '555-3003', '789 Maker Rd, Crafttown', 'Owner is picky about quality'),
    ('Quick Renovations Ltd', '555-4004', '101 Fast Ln, Speedyville', 'Always in a hurry, prepare orders ahead'),
    ('Green Gardens', '555-5005', '202 Nature Way, Plantville', 'Focus on eco-friendly products'),
    ('Local School District', '555-6006', '303 Education Blvd, Learnington', 'Tax exempt, PO required'),
    ('Happy Homeowner', '555-7007', '404 Cozy Corner, Suburbia', 'Weekend warrior, needs guidance'),
    ('Apartment Complex', '555-8008', '505 Rental Row, Leasetown', 'Bulk orders for maintenance'),
    ('Hotel Luxe', '555-9009', '606 Comfort St, Stayville', 'High-end finishes only'),
    ('Budget Rentals', '555-0010', '707 Affordable Ave, Valueplace', 'Price sensitive, needs deals');

-- Suppliers (the people you give money to)
INSERT INTO suppliers (name, phone, address, note) VALUES
    ('Mega Building Supply', '555-1100', '123 Wholesale Dr, Bulkville', 'Best prices on cement and brick'),
    ('Plumbing Universe', '555-2200', '456 Pipe St, Flowtown', 'Delivery every Tuesday'),
    ('Electro Distributors', '555-3300', '789 Volt Ave, Currentville', 'Quality electrical supplies'),
    ('Hardware Haven', '555-4400', '101 Tool Rd, Fixittown', 'Great selection of fasteners'),
    ('Paint Paradise', '555-5500', '202 Color Way, Chromaville', 'Special discounts for bulk orders'),
    ('Tools & More', '555-6600', '303 Equipment Blvd, Geartown', 'New catalog every quarter'),
    ('Lumber Lords', '555-7700', '404 Wood Lane, Timberville', 'Sustainable wood products'),
    ('Global Imports', '555-8800', '505 International Row, Worldville', 'Specialty items from overseas'),
    ('Local Manufacturers', '555-9900', '606 Factory St, Madeithere', 'Supporting local businesses'),
    ('Closeout Kings', '555-0011', '707 Bargain Ave, Dealstown', 'Overstock and clearance items');

-- Purchases (gotta stock up)
INSERT INTO purchases (invoice_number, supplier_id, total) VALUES
    ('PO-2025-001', 1, 5250000),
    ('PO-2025-002', 2, 1850000),
    ('PO-2025-003', 3, 2340000),
    ('PO-2025-004', 4, 1560000),
    ('PO-2025-005', 5, 3200000);

-- Purchase Items (the actual stuff you bought)
INSERT INTO purchase_items (purchase_id, item_id, quantity, price_per_unit, subtotal) VALUES
    -- PO-2025-001
    (1, 1, 50, 50000, 2500000),
    (1, 2, 1000, 1500, 1500000),
    (1, 3, 10, 125000, 1250000),
    
    -- PO-2025-002
    (2, 5, 50, 15000, 750000),
    (2, 6, 100, 2000, 200000),
    (2, 7, 10, 70000, 700000),
    (2, 8, 2, 300000, 600000),
    
    -- PO-2025-003
    (3, 9, 30, 12000, 360000),
    (3, 10, 20, 5000, 100000),
    (3, 11, 12, 32000, 384000),
    (3, 12, 6, 220000, 1320000),
    
    -- PO-2025-004
    (4, 13, 20, 18000, 360000),
    (4, 14, 15, 30000, 450000),
    (4, 15, 20, 25000, 500000),
    (4, 16, 20, 12500, 250000),
    
    -- PO-2025-005
    (5, 21, 20, 80000, 1600000),
    (5, 22, 10, 110000, 1100000),
    (5, 23, 15, 30000, 450000),
    (5, 24, 10, 25000, 250000);

-- Sales (cha-ching!)
INSERT INTO sales (invoice_number, customer_id, total, discount_rp, discount_percent, final_total, payment_method, paid, user_id) VALUES
    ('INV-2025-0001', 1, 520000, 20000, 0, 500000, 'cash', 1, 1),
    ('INV-2025-0002', 2, 3500000, 0, 5, 3325000, 'transfer', 1, 1),
    ('INV-2025-0003', 3, 850000, 50000, 0, 800000, 'QRIS', 1, 2),
    ('INV-2025-0004', 4, 1250000, 0, 0, 1250000, 'cash', 1, 2),
    ('INV-2025-0005', 5, 430000, 30000, 0, 400000, 'transfer', 1, 3),
    ('INV-2025-0006', 6, 2800000, 0, 10, 2520000, 'transfer', 0, 1),
    ('INV-2025-0007', 7, 165000, 15000, 0, 150000, 'cash', 1, 2),
    ('INV-2025-0008', 8, 1850000, 0, 0, 1850000, 'transfer', 1, 3),
    ('INV-2025-0009', 9, 950000, 0, 5, 902500, 'QRIS', 1, 1),
    ('INV-2025-0010', 10, 320000, 20000, 0, 300000, 'cash', 1, 2);

-- Sale Items (what people actually bought)
INSERT INTO sale_items (sale_id, item_id, quantity, price_per_unit, discount_rp, discount_percent, subtotal) VALUES
    -- Sale 1
    (1, 17, 1, 65000, 0, 0, 65000),
    (1, 18, 1, 120000, 0, 0, 120000),
    (1, 19, 1, 35000, 0, 0, 35000),
    (1, 23, 2, 50000, 0, 0, 100000),
    (1, 24, 5, 40000, 0, 0, 200000),
    
    -- Sale 2
    (2, 1, 20, 60000, 0, 5, 1140000),
    (2, 2, 500, 2000, 0, 0, 1000000),
    (2, 3, 5, 200000, 0, 0, 1000000),
    (2, 13, 15, 25000, 0, 10, 337500),
    
    -- Sale 3
    (3, 9, 10, 18000, 0, 0, 180000),
    (3, 10, 5, 8000, 0, 0, 40000),
    (3, 11, 5, 50000, 0, 0, 250000),
    (3, 21, 3, 115000, 0, 0, 345000),
    (3, 23, 1, 50000, 15000, 0, 35000),
    
    -- Sale 4
    (4, 5, 25, 18000, 0, 0, 450000),
    (4, 6, 50, 3000, 0, 0, 150000),
    (4, 7, 2, 120000, 0, 0, 240000),
    (4, 8, 1, 450000, 40000, 0, 410000),
    
    -- Sale 5
    (5, 17, 2, 65000, 0, 0, 130000),
    (5, 19, 3, 35000, 0, 0, 105000),
    (5, 20, 1, 85000, 0, 0, 85000),
    (5, 23, 2, 50000, 0, 0, 100000),
    
    -- Sale 6
    (6, 12, 3, 350000, 0, 0, 1050000),
    (6, 9, 25, 18000, 0, 0, 450000),
    (6, 10, 20, 8000, 0, 0, 160000),
    (6, 11, 8, 50000, 0, 0, 400000),
    (6, 24, 20, 40000, 20000, 0, 780000),
    
    -- Sale 7
    (7, 14, 1, 45000, 0, 0, 45000),
    (7, 19, 2, 35000, 0, 0, 70000),
    (7, 24, 1, 40000, 0, 0, 40000),
    
    -- Sale 8
    (8, 5, 50, 18000, 0, 0, 900000),
    (8, 6, 100, 3000, 0, 0, 300000),
    (8, 21, 5, 115000, 0, 0, 575000),
    (8, 10, 10, 8000, 5000, 0, 75000),
    
    -- Sale 9
    (9, 7, 3, 120000, 0, 0, 360000),
    (9, 21, 3, 115000, 0, 0, 345000),
    (9, 22, 1, 165000, 0, 0, 165000),
    (9, 23, 2, 50000, 0, 10, 90000),
    
    -- Sale 10
    (10, 13, 4, 25000, 0, 0, 100000),
    (10, 14, 3, 45000, 0, 0, 135000),
    (10, 16, 4, 22000, 3000, 0, 85000);

-- Item Splits (when you break bulk items into smaller units)
INSERT INTO item_splits (original_item_id, new_item_id, quantity_split, note) VALUES
    (4, 3, 5, 'Split gravel into sand bags for retail sale'),
    (14, 13, 2, 'Split wood screw set into individual sizes'),
    (18, 17, 3, 'Broke up screwdriver sets to sell individually'),
    (22, 21, 2, 'Repackaged exterior paint into smaller containers');

-- Payments (for those special financial transactions)
INSERT INTO payments (amount, description) VALUES
    (500000, 'Rent payment'),
    (350000, 'Utility bills'),
    (275000, 'Staff salary advance'),
    (1200000, 'Equipment purchase'),
    (180000, 'Transportation costs');

-- Cashbook (your money moves)
INSERT INTO cashbook (date, type, amount, description, related_sale_id, related_payment_id, user_id) VALUES
    (datetime('now', '-30 days'), 'income', 500000, 'Sale INV-2025-0001', 1, NULL, 1),
    (datetime('now', '-28 days'), 'income', 3325000, 'Sale INV-2025-0002', 2, NULL, 1),
    (datetime('now', '-25 days'), 'income', 800000, 'Sale INV-2025-0003', 3, NULL, 2),
    (datetime('now', '-23 days'), 'income', 1250000, 'Sale INV-2025-0004', 4, NULL, 2),
    (datetime('now', '-20 days'), 'income', 400000, 'Sale INV-2025-0005', 5, NULL, 3),
    (datetime('now', '-18 days'), 'income', 150000, 'Sale INV-2025-0007', 7, NULL, 2),
    (datetime('now', '-15 days'), 'income', 1850000, 'Sale INV-2025-0008', 8, NULL, 3),
    (datetime('now', '-10 days'), 'income', 902500, 'Sale INV-2025-0009', 9, NULL, 1),
    (datetime('now', '-7 days'), 'income', 300000, 'Sale INV-2025-0010', 10, NULL, 2),
    (datetime('now', '-29 days'), 'expense', 500000, 'Monthly rent', NULL, 1, 4),
    (datetime('now', '-22 days'), 'expense', 350000, 'Electricity and water', NULL, 2, 4),
    (datetime('now', '-14 days'), 'expense', 275000, 'Advance salary for Budi', NULL, 3, 4),
    (datetime('now', '-8 days'), 'expense', 1200000, 'New computer for inventory', NULL, 4, 4),
    (datetime('now', '-3 days'), 'expense', 180000, 'Delivery transportation', NULL, 5, 3);

-- Trigger to update final totals based on discounts (just for demo)
-- This can be useful but I've commented it out since your app probably calculates this
/*
CREATE TRIGGER update_final_total_after_discount 
AFTER UPDATE OF discount_rp, discount_percent ON sales
BEGIN
    UPDATE sales 
    SET final_total = total - discount_rp - (total * discount_percent / 100)
    WHERE id = NEW.id;
END;
*/

-- More triggers you might find useful:

-- Auto-generate invoice numbers for sales
CREATE TRIGGER generate_sale_invoice
BEFORE INSERT ON sales
WHEN NEW.invoice_number IS NULL
BEGIN
    UPDATE sales
    SET invoice_number = 'INV-' || strftime('%Y-%m', 'now') || '-' || 
        (SELECT PRINTF('%04d', COALESCE(MAX(CAST(SUBSTR(invoice_number, -4) AS INTEGER)), 0) + 1) 
        FROM sales WHERE invoice_number LIKE 'INV-' || strftime('%Y-%m', 'now') || '%');
END;

-- Auto-create cashbook entry when a sale is marked as paid
CREATE TRIGGER create_cashbook_on_paid_sale
AFTER UPDATE OF paid ON sales
WHEN NEW.paid = 1 AND OLD.paid = 0
BEGIN
    INSERT INTO cashbook (date, type, amount, description, related_sale_id, user_id)
    VALUES (CURRENT_TIMESTAMP, 'income', NEW.final_total, 'Sale ' || NEW.invoice_number, NEW.id, NEW.user_id);
END;

-- Keep sum of sale_items matching the sale total
CREATE TRIGGER check_sale_total
AFTER INSERT ON sale_items
BEGIN
    UPDATE sales 
    SET total = (SELECT SUM(subtotal) FROM sale_items WHERE sale_id = NEW.sale_id)
    WHERE id = NEW.sale_id;
    
    -- Also update final_total based on discounts
    UPDATE sales 
    SET final_total = total - discount_rp - (total * discount_percent / 100)
    WHERE id = NEW.sale_id;
END;

-- For tracking inventory value changes
CREATE VIEW inventory_value AS
SELECT 
    SUM(stock * base_price) AS total_cost_value,
    SUM(stock * selling_price) AS total_retail_value,
    SUM((selling_price - base_price) * stock) AS potential_profit
FROM items;

-- For customer purchase history insights
CREATE VIEW customer_purchase_history AS
SELECT 
    c.id AS customer_id,
    c.name AS customer_name,
    COUNT(s.id) AS total_purchases,
    SUM(s.final_total) AS total_spent,
    AVG(s.final_total) AS average_order_value,
    MAX(s.created_at) AS last_purchase_date
FROM 
    customers c
LEFT JOIN 
    sales s ON c.id = s.customer_id
GROUP BY 
    c.id;

-- For popular products analysis
CREATE VIEW product_popularity AS
SELECT 
    i.id AS item_id,
    i.name AS item_name,
    SUM(si.quantity) AS total_quantity_sold,
    COUNT(DISTINCT si.sale_id) AS appeared_in_sales,
    SUM(si.subtotal) AS total_revenue
FROM 
    items i
LEFT JOIN 
    sale_items si ON i.id = si.item_id
GROUP BY 
    i.id
ORDER BY 
    total_quantity_sold DESC;