CREATE DATABASE sencha_db;
CREATE USER'webapp'@'%' IDENTIFIED BY 'jakemedeiros';
GRANT ALL PRIVELIGES ON sencha_db* to 'webapp'@'%';
FLUSH PRIVELIGES

USE sencha_db;

CREATE TABLE buyer (
    buyerID int NOT NULL,
    username varchar(20) NOT NULL,
    buyer_password varchar(20) NOT NULL,
    first_name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
    PRIMARY KEY (buyerID)
);

INSERT INTO buyer
    (buyerID, first_name, last_name, username, buyer_password)
VALUES
    (1, "jake", "medeiros", "jakemedeiros", "password123")


CREATE TABLE order (
    orderID int NOT NULL
    productID int NOT NULL,
    buyerID int NOT NULL,
    sellerID int NOT NULL,
    total_amount int NOT NULL,
    PRIMARY KEY (orderID)
    CONSTRAINT fk_1
        FOREIGN KEY (productID) REFRENCES product (productID),
    CONSTRAINT fk_2
        FOREIGN KEY (buyerID) REFRENCES buyer (buyerID),
    CONSTRAINT fk_3
        FOREIGN KEY (sellerID) REFRENCES seller (sellerID),
);

INSERT INTO order
    (orderID, productID, buyerID, sellerID, total_amount)
VALUES
    (1, 11, 1, 1, 50)


CREATE TABLE product (
    productID int NOT NULL,
    product_name varchar(20) NOT NULL,
    external_company_id int,
    quantity int NOT NULL,
    price int NOT NULL, 
    product_category int NOT NULL,
    PRIMARY KEY (productID),
    CONSTRAINT fk_1
        FOREIGN KEY (external_company_id REFRENCES external_company (external_company_id)
);

INSERT INTO product
    (productID, product_name, external_company_id, quantity, price, product_category)
VALUES
    (1, "jacket", 1, 17, 42, 1)

CREATE TABLE seller (
    sellerID int NOT NULL,
    username varchar(20) NOT NULL,
    seller_password varchar(20) NOT NULL,
    total_balance int DEFAULT 0,
    PRIMARY KEY (sellerID)
);

INSERT INTO seller
    (sellerID, username, seller_password, total_balance)
VALUES
    (1, "notjake", "notpassword123", 1700)

CREATE TABLE product_cart (
    cartID int NOT NULL,
    buyerID int NOT NULL,
    productID int,
    PRIMARY KEY (cartID),
    CONSTRAINT fk_1
        FOREIGN KEY (buyerID) REFRENCES buyer (buyerID)
);

INSERT INTO product_cart
    (cartID, buyerID, productID)
VALUES
    (1, 1, 1)

CREATE TABLE payment (
    paymentID int NOT NULL,
    method varchar(20) NOT NULL,
    amount int NOT NULL,
    PRIMARY KEY (paymentID)
);

INSERT INTO payment
    (paymentID, method, amount)
VALUES
    (1, "credit", 49)

CREATE TABLE product_category (
    categoryID int NOT NULL,
    category_name varchar(20) NOT NULL,
    PRIMARY KEY (categoryID)
);

INSERT INTO product_category
    (categoryID, category_name)
VALUES
    (1, "jackets")

CREATE TABLE external_company (
    companyID int NOT NULL,
    company_name varchar(20) NOT NULL,
    PRIMARY KEY (companyID)
);

INSERT INTO external_company
    (companyID, company_name)
VALUES
    (1, "walmart")

















