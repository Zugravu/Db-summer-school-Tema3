# Update the status of one order
UPDATE orders SET `status` = "livrare"
WHERE id = 1;

# Add comments to one order
UPDATE orders SET `comments` = "ajunge in cateva zile"
WHERE id = 1;

# view all customers
SELECT * FROM customers;

# View all orders fro the third customer
SELECT * FROM orders WHERE customer_id = 3;

# When placing an order update the stock for the products - try to implement with a small umber of queries and explain your choice

# Creating a orderdetails so i can connect the order to the product
INSERT INTO `tema3`.`orderdetails`
(`id`,
`product_code`,
`quantity`,
`priceEach`)
VALUES
(1,"fge4t5",2,1.99);

# Updating the stock based on the product code

UPDATE products prod
INNER JOIN orderdetails ord
ON ord.product_code = prod.code
SET prod.stock = prod.stock - ord.quantity;

# I have tried to only take the last column in orderdetails but I don't know how
# So my only option is to always delete every entry in orderdetails after i update the stock in products
# So that when I want to substract a quantity from stock, I won't substract one I already substracted.
DELETE FROM orderdetails;
