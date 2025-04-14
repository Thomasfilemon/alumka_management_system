-- SQLite schema for alumka.sqlite

-- Drop tables if they exist (in reverse order to avoid foreign key constraints)
DROP TABLE IF EXISTS cashbook;
DROP TABLE IF EXISTS item_splits;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS purchase_items;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS sale_items;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS units;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS users; -- Added users table as it's referenced in foreign keys

-- Enable foreign keys
PRAGMA foreign_keys = ON;

-- Create users table (needed for FKs)
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create category table
CREATE TABLE category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL UNIQUE
);

-- Create units table
CREATE TABLE units (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    conversion_rate_to_base_unit REAL NOT NULL DEFAULT 1
);

-- Create items table
CREATE TABLE items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category_id INTEGER,
    unit_id INTEGER,
    stock REAL DEFAULT 0,
    base_price REAL NOT NULL,
    selling_price REAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE SET NULL,
    FOREIGN KEY (unit_id) REFERENCES units(id) ON DELETE SET NULL
);

-- Create an index on name to speed up searches
CREATE INDEX idx_items_name ON items(name);

-- Create customers table
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    phone TEXT,
    address TEXT,
    note TEXT
);

-- Create suppliers table
CREATE TABLE suppliers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    phone TEXT,
    address TEXT,
    note TEXT
);

-- Create sales table
CREATE TABLE sales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_number TEXT NOT NULL UNIQUE,
    customer_id INTEGER,
    total REAL NOT NULL,
    discount_rp REAL DEFAULT 0,
    discount_percent REAL DEFAULT 0,
    final_total REAL NOT NULL,
    payment_method TEXT CHECK(payment_method IN ('cash', 'transfer', 'QRIS')),
    paid BOOLEAN DEFAULT 0,
    user_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Create sale_items table
CREATE TABLE sale_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sale_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    quantity REAL NOT NULL,
    price_per_unit REAL NOT NULL,
    discount_rp REAL DEFAULT 0,
    discount_percent REAL DEFAULT 0,
    subtotal REAL NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES sales(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE RESTRICT
);

-- Create purchases table
CREATE TABLE purchases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_number TEXT NOT NULL,
    supplier_id INTEGER,
    total REAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE SET NULL
);

-- Create purchase_items table
CREATE TABLE purchase_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    purchase_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    quantity REAL NOT NULL,
    price_per_unit REAL NOT NULL,
    subtotal REAL NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES purchases(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE RESTRICT
);

-- Create item_splits table
CREATE TABLE item_splits (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    original_item_id INTEGER NOT NULL,
    new_item_id INTEGER NOT NULL,
    quantity_split REAL NOT NULL,
    note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (original_item_id) REFERENCES items(id) ON DELETE RESTRICT,
    FOREIGN KEY (new_item_id) REFERENCES items(id) ON DELETE RESTRICT
);

-- Create payments table (needed for FK in cashbook)
CREATE TABLE payments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount REAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT
);

-- Create cashbook table
CREATE TABLE cashbook (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    type TEXT CHECK(type IN ('income', 'expense')),
    amount REAL NOT NULL,
    description TEXT,
    related_sale_id INTEGER,
    related_payment_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (related_sale_id) REFERENCES sales(id) ON DELETE SET NULL,
    FOREIGN KEY (related_payment_id) REFERENCES payments(id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Create some triggers to automatically update the updated_at field
CREATE TRIGGER update_items_timestamp 
AFTER UPDATE ON items
BEGIN
    UPDATE items SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Trigger to update stock when purchase_items are added
CREATE TRIGGER update_stock_after_purchase
AFTER INSERT ON purchase_items
BEGIN
    UPDATE items 
    SET stock = stock + NEW.quantity
    WHERE id = NEW.item_id;
END;

-- Trigger to update stock when sale_items are added
CREATE TRIGGER update_stock_after_sale
AFTER INSERT ON sale_items
BEGIN
    UPDATE items 
    SET stock = stock - NEW.quantity
    WHERE id = NEW.item_id;
END;

-- Insert some initial data for testing
INSERT INTO users (username, password) VALUES ('admin', 'hashed_password_here');

INSERT INTO category (category_name) VALUES ('Electronics');
INSERT INTO category (category_name) VALUES ('Stationery');
INSERT INTO category (category_name) VALUES ('Groceries');

INSERT INTO units (name, conversion_rate_to_base_unit) VALUES ('piece', 1);
INSERT INTO units (name, conversion_rate_to_base_unit) VALUES ('box', 10);
INSERT INTO units (name, conversion_rate_to_base_unit) VALUES ('meter', 1);
INSERT INTO units (name, conversion_rate_to_base_unit) VALUES ('roll', 50);
INSERT INTO units (name, conversion_rate_to_base_unit) VALUES ('batang', 1);