CREATE DATABASE zomato_delivery_boy;

USE zomato_delivery_boy;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    UNIQUE (email)
);


CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    UNIQUE (phone)
);

CREATE TABLE Menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Order_Table (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_total DECIMAL(10,2) NOT NULL,
    delivery_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Order_Details (
    order_details_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Order_Table(order_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Order_Table(order_id)
);

CREATE TABLE Delivery_Boy (
    delivery_boy_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    rid int not null,
    phone VARCHAR(20) NOT NULL,
    location VARCHAR(255) NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (rid) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Order_Assign (
    order_assign_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    delivery_boy_id INT NOT NULL,
    assigned_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Order_Table(order_id),
    FOREIGN KEY (delivery_boy_id) REFERENCES Delivery_Boy(delivery_boy_id)
);


CREATE TABLE Rating (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    delivery_boy_id INT NOT NULL,
    rating INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (delivery_boy_id) REFERENCES Delivery_Boy(delivery_boy_id)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    delivery_boy_id INT,
    rating INT,
    feedback TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (delivery_boy_id) REFERENCES Delivery_Boy(delivery_boy_id)
);

CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    message TEXT,
    is_read BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

-- Inserting random data into the Users table
INSERT INTO Users (name, email, password, phone) VALUES
('John Doe', 'johndoe@example.com', 'password123', '123-456-7890'),
('Jane Smith', 'janesmith@example.com', 'securepass', '987-654-3210'),
('Alice Johnson', 'alicej@example.com', 'mypassword', '555-123-4567'),
('Bob Williams', 'bobw@example.com', 'bobpass', '111-222-3333'),
('Eve Brown', 'eveb@example.com', 'evepass', '999-888-7777'),
('Michael Davis', 'michaeld@example.com', 'mikepass', '444-555-6666'),
('Sarah Taylor', 'saraht@example.com', 'password123', '777-888-9999'),
('David Martinez', 'davidm@example.com', 'davidpass', '666-555-4444'),
('Emily Wilson', 'emilyw@example.com', 'emilypass', '222-333-4444'),
('James Anderson', 'jamesa@example.com', 'jamespass', '888-999-0000');

-- Inserting random data into the Restaurants table
INSERT INTO Restaurants (name, address, phone) VALUES
('Restaurant A', '123 Main St, City', '111-222-3333'),
('Restaurant B', '456 Park Ave, Town', '444-555-6666'),
('Restaurant C', '789 Broadway, Village', '777-888-9999'),
('Restaurant D', '101 Pine St, Suburb', '222-333-4444'),
('Restaurant E', '202 Oak Ave, Countryside', '888-999-0000'),
('Restaurant F', '303 Elm St, Downtown', '555-123-4567'),
('Restaurant G', '404 Maple Dr, Lakeside', '123-456-7890'),
('Restaurant H', '505 Cedar Ln, Mountain', '999-888-7777'),
('Restaurant I', '606 Walnut St, Beachfront', '987-654-3210'),
('Restaurant J', '707 Pine Ave, Hilltop', '666-555-4444');


-- Inserting random data into the Menu table
INSERT INTO Menu (restaurant_id, item_name, description, price) VALUES
(1, 'Item 1', 'Description for Item 1', 10.99),
(1, 'Item 2', 'Description for Item 2', 8.50),
(2, 'Item 3', 'Description for Item 3', 15.25),
(2, 'Item 4', 'Description for Item 4', 12.75),
(3, 'Item 5', 'Description for Item 5', 9.99),
(3, 'Item 6', 'Description for Item 6', 11.50),
(4, 'Item 7', 'Description for Item 7', 7.75),
(4, 'Item 8', 'Description for Item 8', 14.00),
(5, 'Item 9', 'Description for Item 9', 18.99),
(5, 'Item 10', 'Description for Item 10', 22.50);

-- Inserting random data into the Order_Table table
INSERT INTO Order_Table (user_id, restaurant_id, order_total, delivery_status) VALUES
(1, 1, 35.49, 'Delivered'),
(2, 2, 28.25, 'In Progress'),
(3, 3, 21.49, 'Delivered'),
(4, 4, 19.50, 'Delivered'),
(5, 5, 31.99, 'Pending'),
(6, 1, 45.75, 'Delivered'),
(7, 2, 38.50, 'Delivered'),
(8, 3, 14.75, 'Cancelled'),
(9, 4, 22.99, 'Delivered'),
(10, 5, 19.50, 'Delivered');


-- Inserting random data into the Order_Details table
INSERT INTO Order_Details (order_id, menu_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(3, 5, 1),
(4, 8, 2),
(5, 10, 1),
(6, 4, 2),
(7, 6, 1),
(8, 9, 3),
(9, 3, 1);

-- Inserting random data into the Payment table
INSERT INTO Payment (order_id, payment_method, amount, status) VALUES
(1, 'Credit Card', 35.49, 'Paid'),
(2, 'Cash On Delivery', 28.25, 'Pending'),
(3, 'Credit Card', 21.49, 'Paid'),
(4, 'PayPal', 19.50, 'Paid'),
(5, 'Credit Card', 31.99, 'Paid'),
(6, 'Credit Card', 45.75, 'Paid'),
(7, 'Cash On Delivery', 38.50, 'Paid'),
(8, 'Credit Card', 14.75, 'Refunded'),
(9, 'Credit Card', 22.99, 'Paid'),
(10, 'PayPal', 19.50, 'Paid');


-- Inserting random data into the Delivery_Boy table
INSERT INTO Delivery_Boy (name, rid, phone, location, item_name, price) VALUES
('Delivery Person 1',1, '111-222-3333', 'Location A', 'Item 1', 10.99),
('Delivery Person 2',2, '444-555-6666', 'Location B', 'Item 2', 8.50),
('Delivery Person 3',3, '777-888-9999', 'Location C', 'Item 3', 15.25),
('Delivery Person 4',4, '222-333-4444', 'Location D', 'Item 4', 12.75),
('Delivery Person 5',5, '888-999-0000', 'Location E', 'Item 5', 9.99),
('Delivery Person 6',6, '555-123-4567', 'Location F', 'Item 6', 11.50),
('Delivery Person 7',7, '123-456-7890', 'Location G', 'Item 7', 7.75),
('Delivery Person 8',8, '999-888-7777', 'Location H', 'Item 8', 14.00),
('Delivery Person 9',9, '987-654-3210', 'Location I', 'Item 9', 18.99),
('Delivery Person 10',10, '666-555-4444', 'Location J', 'Item 10', 22.50);

-- Inserting random data into the Order_Assign table (continued)
INSERT INTO Order_Assign (order_id, delivery_boy_id) VALUES
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting random data into the Rating table
INSERT INTO Rating (user_id, delivery_boy_id, rating) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 4),
(7, 7, 5),
(8, 8, 3),
(9, 9, 4),
(10, 10, 5);


-- Inserting random data into the Feedback table
INSERT INTO Feedback (user_id, delivery_boy_id, rating, feedback) VALUES
(1, 1, 4, 'Good service overall.'),
(2, 2, 5, 'Excellent delivery, very fast.'),
(3, 3, 3, 'Delivery was late, but food was good.'),
(4, 4, 4, 'Polite delivery person, food arrived on time.'),
(5, 5, 5, 'Amazing service, will order again.'),
(6, 6, 4, 'Delivery person was friendly.'),
(7, 7, 5, 'No issues with delivery, everything went smoothly.'),
(8, 8, 3, 'Delivery took longer than expected.'),
(9, 9, 4, 'Food was hot and fresh upon delivery.'),
(10, 10, 5, 'Delivery person was professional and courteous.');


-- Inserting random data into the Notifications table
INSERT INTO Notifications (user_id, message, is_read) VALUES
(1, 'Your order has been delivered.', TRUE),
(2, 'Your order is in progress.', FALSE),
(3, 'Your order has been delivered.', TRUE),
(4, 'Your order has been delivered.', TRUE),
(5, 'Your order is pending.', FALSE),
(6, 'Your order has been delivered.', TRUE),
(7, 'Your order has been delivered.', TRUE),
(8, 'Your order has been cancelled.', TRUE),
(9, 'Your order has been delivered.', TRUE),
(10, 'Your order has been delivered.', TRUE);


-- Inserting random data into the Admins table
INSERT INTO Admins (username, email, password) VALUES
('admin1', 'admin1@example.com', 'adminpass1'),
('admin2', 'admin2@example.com', 'adminpass2'),
('admin3', 'admin3@example.com', 'adminpass3'),
('admin4', 'admin4@example.com', 'adminpass4'),
('admin5', 'admin5@example.com', 'adminpass5'),
('admin6', 'admin6@example.com', 'adminpass6'),
('admin7', 'admin7@example.com', 'adminpass7'),
('admin8', 'admin8@example.com', 'adminpass8'),
('admin9', 'admin9@example.com', 'adminpass9'),
('admin10', 'admin10@example.com', 'adminpass10');
