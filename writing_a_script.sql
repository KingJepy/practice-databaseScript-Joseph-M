START TRANSACTION;

-- Drop existing tables 
DROP TABLE IF EXISTS ticket_sales;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS venues;
DROP TABLE IF EXISTS full_event;

-- create venues
CREATE TABLE venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create ticket_sales
CREATE TABLE ticket_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_id INT NOT NULL,
    event_date TIMESTAMP NOT NULL,
    number_sold INT NOT NULL,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

-- create bookings
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    venue_id INT NOT NULL,
    event_type VARCHAR(40) NOT NULL,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

CREATE TABLE full_event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    venue_id INT NOT NULL,
    booking_id INT NOT NULL,
    sale_id INT,
    event_type VARCHAR(40) NOT NULL,
    event_organizer VARCHAR(80) NOT NULL,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (sale_id) REFERENCES ticket_sales(sale_id)
);

-- insert test data
-- Venues
INSERT INTO venues (name) VALUES
('Grand Convention Center'),
('Downtown Concert Hall'),
('Lakeside Pavilion'),
('City Expo Grounds');

-- Bookings
INSERT INTO bookings (first_name, last_name, venue_id, event_type) VALUES
('Alice', 'Johnson', 1, 'Conference'),
('Michael', 'Smith', 2, 'Concert'),
('Sophia', 'Lee', 3, 'Wedding'),
('David', 'Brown', 4, 'Trade Show');

-- Ticket sales
INSERT INTO ticket_sales (venue_id, event_date, number_sold) VALUES
(1, '2025-09-10 09:00:00', 300),
(2, '2025-09-15 19:00:00', 1200),
(3, '2025-09-20 14:00:00', 150),
(4, '2025-09-25 10:00:00', 800);

-- Full events 
INSERT INTO full_event (title, venue_id, booking_id, sale_id, event_type, event_organizer) VALUES
('Tech Innovators 2025', 1, 1, 1, 'Conference', 'Alice Johnson'),
('Rock the City Tour', 2, 2, 2, 'Concert', 'Michael Smith'),
('Lee Wedding Celebration', 3, 3, 3, 'Wedding', 'Sophia Lee'),
('Global Trade Expo', 4, 4, 4, 'Trade Show', 'David Brown');

-- Commit 
COMMIT;




