DROP TABLE IF EXISTS address_entries;
DROP TABLE IF EXISTS phone_numbers;
DROP TABLE IF EXISTS emails;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  user_name VARCHAR(255)
);

CREATE TABLE address_entries (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  user_id INTEGER
);

CREATE TABLE emails (
  id INTEGER PRIMARY KEY,
  address_entry_id INTEGER,  
  email_address VARCHAR(255),
  category VARCHAR(20),
  user_id INTEGER
);

CREATE TABLE phone_numbers (
  id INTEGER PRIMARY KEY,
  address_entry_id INTEGER,
  phone_number VARCHAR(255),
  category VARCHAR(20),
  user_id INTEGER
);