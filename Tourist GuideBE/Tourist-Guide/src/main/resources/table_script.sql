DROP DATABASE IF EXISTS my_tourist_guide;
CREATE DATABASE my_tourist_guide;
USE my_tourist_guide;
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_type ENUM('GUIDE', 'VISITOR', 'ADMIN') NOT NULL,
    phone VARCHAR(20),
    location VARCHAR(100),
    is_verified BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO user (id, name, email, password, user_type, phone, location, is_verified, created_at) VALUES
(1, 'Nishanth Guide', 'nishanth@guide.com', 'hashedpwd1', 'GUIDE', '9876543210', 'Goa', true, NOW()),
(2, 'Arjun Guide', 'arjun@guide.com', 'hashedpwd2', 'GUIDE', '9876543211', 'Delhi', true, NOW()),
(3, 'Sonia Visitor', 'sonia@visitor.com', 'hashedpwd3', 'VISITOR', NULL, NULL, false, NOW()),
(4, 'Rahul Visitor', 'rahul@visitor.com', 'hashedpwd4', 'VISITOR', NULL, NULL, false, NOW()),
(5, 'Admin One', 'admin@site.com', 'adminpwd', 'ADMIN', NULL, NULL, false, NOW());


CREATE TABLE guide_profile (
    id INTEGER PRIMARY KEY,
    bio TEXT,
    education_qualification VARCHAR(255),
    certificate_url VARCHAR(255),
    rating DECIMAL(2,1) DEFAULT 0.0,
    availability TEXT,
    FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE
);
INSERT INTO guide_profile (id, bio, education_qualification, certificate_url, rating, availability) VALUES
(1, 'Experienced local guide with 10+ years in Goa.', 'B.A. in Tourism', 'certs/guide1.pdf', 4.7, 'Mon-Fri'),
(2, 'Delhi-based heritage and culture expert.', 'Certified Guide by Govt. of India', 'certs/guide2.pdf', 4.9, 'Weekends');


CREATE TABLE tour (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    guide_id INTEGER NOT NULL,
    title VARCHAR(150),
    description TEXT,
    price DECIMAL(10, 2),
    max_group_size INT,
    category VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guide_id) REFERENCES user(id) ON DELETE CASCADE
);
INSERT INTO tour (id, guide_id, title, description, price, max_group_size, category, created_at) VALUES
(1, 1, 'Goa Beach Tour', 'A full-day beach exploration in North Goa.', 1200.00, 10, 'Beach', NOW()),
(2, 2, 'Old Delhi Walk', 'Explore the hidden alleys and Mughal sites.', 1500.00, 8, 'Historical', NOW());

CREATE TABLE booking (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    visitor_id INTEGER NOT NULL,
    tour_id INTEGER NOT NULL,
    booking_date DATE,
    participants INT,
    status ENUM('PENDING', 'CONFIRMED', 'CANCELLED') DEFAULT 'PENDING',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (visitor_id) REFERENCES user(id),
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);
INSERT INTO booking (id, visitor_id, tour_id, booking_date, participants, status, created_at) VALUES
(1, 3, 1, '2025-07-10', 2, 'CONFIRMED', NOW()),
(2, 4, 2, '2025-07-12', 1, 'PENDING', NOW());

CREATE TABLE review (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    visitor_id INTEGER,
    guide_id INTEGER,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (visitor_id) REFERENCES user(id),
    FOREIGN KEY (guide_id) REFERENCES user(id)
);
INSERT INTO review (id, visitor_id, guide_id, rating, comment, created_at) VALUES
(1, 3, 1, 5, 'Amazing tour and friendly guide!', NOW()),
(2, 4, 2, 4, 'Very informative and well-paced.', NOW());

CREATE TABLE message (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    sender_id INTEGER,
    receiver_id INTEGER,
    content TEXT,
    sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user(id),
    FOREIGN KEY (receiver_id) REFERENCES user(id)
);
INSERT INTO message (id, sender_id, receiver_id, content, sent_at) VALUES
(1, 3, 1, 'Hi, what should I carry for the beach tour?', NOW()),
(2, 1, 3, 'Just sunscreen and water will do!', NOW());

CREATE TABLE notification (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    user_type ENUM('GUIDE', 'VISITOR'),
    message TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO notification (id, user_id, user_type, message, is_read, created_at) VALUES
(1, 1, 'GUIDE', 'You have a new booking!', false, NOW()),
(2, 3, 'VISITOR', 'Your tour is confirmed.', true, NOW());

CREATE TABLE payment (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    booking_id INTEGER,
    amount DECIMAL(10, 2),
    payment_status ENUM('PENDING', 'COMPLETED', 'FAILED') DEFAULT 'PENDING',
    payment_date DATETIME,
    stripe_session_id VARCHAR(255),
    FOREIGN KEY (booking_id) REFERENCES booking(id)
);
INSERT INTO payment (id, booking_id, amount, payment_status, payment_date, stripe_session_id) VALUES
(1, 1, 1200.00, 'COMPLETED', NOW(), 'sess_abc123'),
(2, 2, 1500.00, 'PENDING', NULL, 'sess_xyz789');
select * from user;
select * from guide_profile;
select * from tour;
select * from booking;
select * from review;
select * from message;
select * from notification;
select * from payment;