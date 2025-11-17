-- Write Insert, Delete and Update statements to add, 
-- change, or remove games.

-- Add at least one new publisher and one new genre 
-- which you will when you add more games.
INSERT INTO publisher (name) VALUES ('Xbox');
INSERT INTO genre (name) VALUES ('Horror');
-- The publishers and genres can be real or imagined.

-- Update the price of all games published by Nintendo by 10%.
UPDATE games 
INNER JOIN publisher ON games.publisher_num = publisher.Id
SET games.price = games.price * 1.10
WHERE publisher.`Name` = 'Nintendo';

-- Delete from games all games published by Activision
DELETE games FROM games 
INNER JOIN publisher ON games.publisher_num = publisher.Id
WHERE publisher.`Name` = 'Activision';

-- Add some more games to the games table using Insert Statements.
 INSERT INTO games (title, publisher_id, genre_id, price, description) VALUES
('Balatro', 5, 7, 19.99, 'card game'),
('Sonic Racing', 5, 7, 15.99, 'racing game'),
-- Remember to insert some games with your new publisher and genre records (hhhhhhhhhhhhhhhhhhh).