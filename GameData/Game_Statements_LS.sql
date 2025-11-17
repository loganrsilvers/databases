-- GameData is database thing
-- select blank from GameDate where thingINeed 
-- ^ this equals thing it will return 
-- * = all
-- comma , for and or AND for and 

-- Use one or more lines per query, delete, insert, 
-- or update statement.
-- A query to retrieve all Games, no order specified.
SELECT *
FROM GameData;
-- A query to retrieve all Games when the genre is 
-- "Action-Adventure", no order specified
SELECT *
FROM GameData
WHERE Genre = 'Action-adventure';
-- A query to retrieve the publisher and 
-- price for all Games that are less than 40 but not free.
SELECT Publisher, Price
FROM GameData
-- and thingy
WHERE Price < 40 AND Price > 0
-- Order this result by price.
ORDER BY Price;
-- A query to retrieve the title, genre,
-- and publisher for all games ordered by genre 
-- and then by title.
SELECT Title, Genre, Publisher
FROM GameData
ORDER BY Genre, Title;
-- A query to retrieve all games from the 
-- publisher "Activision".
SELECT *
FROM GameData
-- sungle quotes '' for the keywords instead of ""
WHERE Publisher = 'Activision';


