# Bella Beauty Database

This folder contains the SQL scripts required to set up and populate the database for the Bella Beauty e-commerce website.

## Files

- `schema.sql`: Contains the `CREATE TABLE` statements to define the structure of the database, including tables for users, products, categories, orders, and reviews.
- `seed.sql`: Contains `INSERT` statements to populate the database with sample data. This includes categories and products that match the current website content, along with some sample users and reviews.

## How to Use

You can use these files to set up a local database for development. You will need a relational database system like PostgreSQL or MySQL installed.

### For PostgreSQL Users

1.  Create a new database (e.g., `bella_beauty_db`).
2.  Run the schema file to create the tables:
    ```bash
    psql -U your_username -d bella_beauty_db -f schema.sql
    ```
3.  Run the seed file to populate the tables with sample data:
    ```bash
    psql -U your_username -d bella_beauty_db -f seed.sql
    ```

### For MySQL Users

1.  Create a new database (e.g., `CREATE DATABASE bella_beauty_db;`).
2.  Use the database and run the scripts:
    ```bash
    mysql -u your_username -p bella_beauty_db < schema.sql
    mysql -u your_username -p bella_beauty_db < seed.sql
    ```