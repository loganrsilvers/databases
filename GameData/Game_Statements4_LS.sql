-- Retrieving data
-- A query to retrieve all Games, no order specified.
SELECT * FROM games;

-- A query to retrieve all Games when the 
-- genre is "Action-Adventure", no order specified
SELECT * FROM games INNER JOIN genre ON games.genre_num = genre.Id 
--matching the ids
WHERE genre.name = 'Action-Adventure';

-- A query to retrieve the publisher and price for 
-- all Games that are less than 40 but not free.
SELECT publisher.`Name`, games.price FROM games
INNER JOIN publisher ON games.publisher_num = publisher.Id
-- matching ids
WHERE games.price < 40 AND games.price > 0
-- Order this result by price.
ORDER BY games.Price;

-- A query to retrieve the title, genre, and publisher 
-- for all games
SELECT games.Title, genre.name, publisher.name FROM games
INNER JOIN genre.name ON games.genre_num = genre.Id 
-- can i combine them all into the same statement?
INNER JOIN publisher.name ON games.publisher_num = publisher.Id
-- ordered by genre and then by title.
ORDER BY genre.name, games.title;

-- A query to retrieve all games from the publisher "Activision".
SELECT * FROM games
INNER JOIN publisher ON games.publisher_num = publisher.Id
WHERE publisher.`Name` = 'Activision';