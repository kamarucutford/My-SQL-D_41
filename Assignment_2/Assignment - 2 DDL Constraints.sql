CREATE DATABASE Sales;

USE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY UNIQUE NOT NULL,
    Customer_name VARCHAR(255) NOT NULL,
    Product_Category VARCHAR(255) NOT NULL,
    Ordered_item VARCHAR(255) NOT NULL,
    Contact_No VARCHAR(15) NOT NULL
);
desc orders;

-- adding new column Order_quantity

ALTER TABLE Orders ADD order_quantity INT NOT NULL;

-- Renaming order_table to  Sales_order

ALTER TABLE Orders RENAME TO sales_orders;
desc sales_orders;

-- Inserting 10 rows to the Sales_order Table

INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alice', 'Electronics', 'Smartphone', '1234567890', 1),
(2, 'Osho', 'Books', 'Fiction Novel', '2345678901', 4),
(3, 'Peter', 'Clothing', 'T-shirt', '3456789012', 3),
(4, 'Micheal', 'Home Appliances', 'Blender', '4567890123', 2),
(5, 'Suresh', 'Beauty', 'Face Cream', '5678901234', 2),
(6, 'Dileep', 'Sports', 'Tennis Racket', '6789012345', 3),
(7, 'Mohanlal', 'Electronics', 'Laptop', '7890123456', 4),
(8, 'Krishna', 'Toys', 'Doll', '8901234567', 4),
(9, 'Sulaiman', 'Books', 'Science Book', '9012345678', 1),
(10, 'Nakulan', 'Clothing', 'Jeans', '0123456789', 2);

select * from sales_orders;

-- Retriving customer_name and ordered_item from sales _orders table

SELECT Customer_name, Ordered_item FROM sales_orders;

-- updating command to change the name of the product for any row

UPDATE sales_orders SET Ordered_item = 'Updated sports' WHERE Order_Id = 3;

-- Deleting sales_ordertable 

drop table sales_orders;










