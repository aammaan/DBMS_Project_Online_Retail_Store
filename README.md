# Online Retail Store Database System

## Overview

This project involves the development of a database system for an online retail store, designed to cater to different types of users: admin, customer, and delivery person. The system facilitates various operations such as user authentication, product management, order processing, and delivery tracking through a command-line interface (CLI).

## Features

### Admin Functions
- **Login:** Secure authentication for admins.
- **Add Products:** Insert new products into the database.
- **Delete Out of Stock Products:** Remove products marked as "Not Available."
- **Update Product Price:** Modify the price of existing products.
- **View Customer Accounts:** Display all registered customer accounts.
- **View Products:** List all available products.
- **View Successful Orders:** Display orders that have been successfully paid for.
- **Update Stock Quantity:** Modify the stock quantity of a specific product.
- **View Delivery Persons:** List all registered delivery persons.

### Customer Functions
- **Create Account:** Register a new customer account.
- **Login:** Secure authentication for customers.
- **Browse Products:** Display all available products.
- **Add to Cart:** Add products to the shopping cart.
- **Delete from Cart:** Remove products from the shopping cart.
- **View Cart:** Display the contents of the shopping cart.
- **View Orders:** List all orders placed by the customer.
- **View Payments:** Display payment information for orders.

### Delivery Person Functions
- **Create Account:** Register a new delivery person account.
- **Login:** Secure authentication for delivery persons.
- **View Assigned Orders:** Display orders assigned to the delivery person.

## System Architecture

### Database Schema
- **Admin:** Stores admin credentials.
- **User:** Stores customer information and credentials.
- **Product:** Contains product details including price, category, status, and stock units.
- **Order:** Records order information and associated customer details.
- **Payment:** Manages payment details and status.
- **DeliveryPerson:** Stores delivery person information and credentials.

### SQL Implementation
- **MySQL Database:** Used to store and manage all the data.
- **Complex Queries:** Handle data retrieval and manipulation efficiently.

### Command Line Interface (CLI)
- **User-Friendly Interface:** Provides clear options and feedback for user actions.
- **Comprehensive Features:** Allows different types of users to perform relevant operations.

## Code Structure

### `main.py`
The main script containing the CLI logic for interacting with the database.

### `database.sql`
The SQL script to set up the database schema and initial data.

