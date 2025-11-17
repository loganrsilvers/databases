-- Write Insert, Delete and Update statements to add, 
-- change, or remove games.
-- Update the price of all games published by Nintendo by 10%.
UPDATE GameData
SET Price = Price * 1.10
WHERE Publisher = 'Nintendo';
-- Delete from games all games published by Activision
DELETE FROM GameData
WHERE Publisher = 'Activision';
-- Add some more games to the games table using Insert 
-- Statements. A good place to look for game titles is: 
-- New On SteamLinks to an external site.
INSERT INTO GameData (Game_Id, Title, Publisher, Genre, Price, Discription)
VALUES
(21, 'Minecraft', 'Mojang', 'Crafting', 24.99, 'You mine. You craft.'),
(22, 'Roblox', 'Roblox Developers', 'Misc', 24.99, 'Children in middle school love this game rn.');