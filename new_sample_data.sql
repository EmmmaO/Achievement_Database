-- =========================================================
-- COMPLETE DATABASE SEED
-- Assumes the database/tables are empty.
-- IDs will start at 1.
-- =========================================================


-- =========================================================
-- USERS
-- =========================================================

INSERT INTO Users (Username, Email) VALUES
('Emma', 'emma@mail.com'),
('Sebastian', 'sebastian@mail.com'),
('Liam', 'liam@mail.com'),
('Olivia', 'olivia@mail.com'),
('Noah', 'noah@mail.com'),
('Ava', 'ava@mail.com'),
('Lucas', 'lucas@mail.com'),
('Sophia', 'sophia@mail.com'),
('Mason', 'mason@mail.com'),
('Isabella', 'isabella@mail.com'),
('Ethan', 'ethan@mail.com');


-- =========================================================
-- GAMES
-- =========================================================

INSERT INTO Games (GameName, Genre, ReleaseDate) VALUES
('Minecraft', 'Sandbox', '2011-11-18'),
('Elden Ring', 'RPG', '2022-02-25'),
('Hades', 'Roguelike', '2020-09-17'),
('The Witcher 3', 'RPG', '2015-05-19'),
('Celeste', 'Platformer', '2018-01-25'),
('Stardew Valley', 'Simulation', '2016-02-26'),
('Cyberpunk 2077', 'Action RPG', '2020-12-10'),
('Terraria', 'Sandbox', '2011-05-16'),
('Hollow Knight', 'Metroidvania', '2017-02-24'),
('God of War', 'Action Adventure', '2018-04-20'),
('Portal 2', 'Puzzle', '2011-04-19');


-- =========================================================
-- ACHIEVEMENTS
-- =========================================================

-- MINECRAFT - GameID 1

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(1, 'First Night', 'Survive first night', 10),
(1, 'Diamond Miner', 'Mine diamond', 25),
(1, 'The End?', 'Enter End dimension', 50),
(1, 'Getting an Upgrade', 'Craft a better pickaxe', 10),
(1, 'Hot Stuff', 'Fill a bucket with lava', 15),
(1, 'Into the Nether', 'Enter the Nether dimension', 30),
(1, 'Enchanter', 'Construct an enchantment table', 25),
(1, 'Beaconator', 'Create and activate a beacon', 75);


-- ELDEN RING - GameID 2

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(2, 'Margit Defeated', 'Beat Margit', 20),
(2, 'Godrick Defeated', 'Beat Godrick', 30),
(2, 'Elden Lord', 'Finish game', 100),
(2, 'Great Rune', 'Restore a Great Rune', 20),
(2, 'Rennala Defeated', 'Defeat Rennala, Queen of the Full Moon', 30),
(2, 'Radahn Defeated', 'Defeat Starscourge Radahn', 40),
(2, 'Malenia Defeated', 'Defeat Malenia, Blade of Miquella', 75),
(2, 'Age of Stars', 'Complete the Age of Stars ending', 100);


-- HADES - GameID 3

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(3, 'Escape Tartarus', 'Escape Tartarus', 20),
(3, 'Defeat Hades', 'Beat Hades', 80),
(3, 'First Escape', 'Escape the Underworld for the first time', 30),
(3, 'Blood and Darkness', 'Unlock a weapon aspect', 15),
(3, 'Boiling Blood', 'Unlock a Mirror of Night talent', 10),
(3, 'Friends in High Places', 'Reach maximum affinity with a character', 40),
(3, 'Homecoming', 'Complete the main story', 100);


-- THE WITCHER 3 - GameID 4

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(4, 'Lilac and Gooseberries', 'Complete the first major quest', 10),
(4, 'Monster Slayer', 'Defeat your first monster', 20),
(4, 'King of the Wild Hunt', 'Complete the main story', 100),
(4, 'Kaer Morhen', 'Reach Kaer Morhen', 15),
(4, 'Family Matters', 'Complete the Family Matters quest', 25),
(4, 'Wild Rose Dethorned', 'Defeat a group of renegade knights', 30),
(4, 'Master Marksman', 'Kill an enemy with a crossbow from a long distance', 40),
(4, 'Passed the Trial', 'Complete the main story', 100);


-- CELESTE - GameID 5

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(5, 'First Steps', 'Complete the first chapter', 10),
(5, 'Strawberry Collector', 'Collect 10 strawberries', 25),
(5, 'Reach the Summit', 'Complete the main story', 100),
(5, 'Forsaken City', 'Complete Chapter 1', 10),
(5, 'Old Site', 'Complete Chapter 2', 15),
(5, 'Golden Feather', 'Complete a difficult challenge', 25),
(5, 'Crystal Heart', 'Collect a Crystal Heart', 30),
(5, 'Reflection', 'Complete Chapter 6', 40);


-- STARDEW VALLEY - GameID 6

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(6, 'Greenhorn', 'Earn 15,000 gold', 10),
(6, 'A Big Help', 'Complete 10 Help Wanted requests', 25),
(6, 'Local Legend', 'Complete the Community Center', 100),
(6, 'Moving Up', 'Upgrade your house for the first time', 15),
(6, 'Cook', 'Cook your first recipe', 10),
(6, 'Fisherman', 'Catch 10 different fish', 20),
(6, 'Millionaire', 'Earn 1,000,000 gold', 50),
(6, 'Full House', 'Upgrade your farmhouse to the maximum level', 75);


-- CYBERPUNK 2077 - GameID 7

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(7, 'The Fool', 'Complete the opening mission', 10),
(7, 'Gunslinger', 'Defeat an enemy with a revolver', 20),
(7, 'Never Fade Away', 'Complete the main story', 100),
(7, 'The Rescue', 'Complete the opening mission', 10),
(7, 'Automatic Love', 'Complete the Automatic Love quest', 20),
(7, 'Ripperdoc', 'Install your first cyberware upgrade', 15),
(7, 'Cyberpsycho', 'Defeat a cyberpsycho', 30),
(7, 'Legend of Night City', 'Reach maximum street cred', 75);


-- TERRARIA - GameID 8

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(8, 'Timber!', 'Chop down your first tree', 10),
(8, 'Eye of Cthulhu', 'Defeat the Eye of Cthulhu', 30),
(8, 'Terrarian', 'Defeat the Moon Lord', 100),
(8, 'Heavy Metal', 'Obtain your first metal pickaxe', 10),
(8, 'Blood Moon', 'Survive a Blood Moon event', 20),
(8, 'Worm Food', 'Summon and defeat the Eater of Worlds', 30),
(8, 'Hardmode', 'Enter Hardmode', 40),
(8, 'Lunar Events', 'Begin the Lunar Events', 50);


-- HOLLOW KNIGHT - GameID 9

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(9, 'False Knight', 'Defeat the False Knight', 20),
(9, 'Mantis Lords', 'Defeat the Mantis Lords', 40),
(9, 'The Hollow Knight', 'Defeat the Hollow Knight', 100),
(9, 'Falsehood', 'Defeat the False Knight', 15),
(9, 'Hornet Defeated', 'Defeat Hornet', 25),
(9, 'Soul Master', 'Defeat the Soul Master', 35),
(9, 'Dream Warrior', 'Defeat a Dream Warrior', 30),
(9, 'Dream No More', 'Complete the Dream No More ending', 100);


-- GOD OF WAR - GameID 10

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(10, 'The Journey Begins', 'Leave home with Atreus', 10),
(10, 'Dragon Slayer', 'Defeat a dragon', 40),
(10, 'Father and Son', 'Complete the main story', 100),
(10, 'A New Beginning', 'Complete the opening sequence', 10),
(10, 'Worthy', 'Fully upgrade the Leviathan Axe', 30),
(10, 'Dark Elves', 'Defeat the Dark Elf King', 25),
(10, 'Like Oil and Water', 'Complete all favors for the Dwarves', 40),
(10, 'Chooser of the Slain', 'Defeat all Valkyries', 75);


-- PORTAL 2 - GameID 11

INSERT INTO Achievements
(GameID, AchievementName, Description, Points) VALUES
(11, 'Wake Up Call', 'Survive the opening test', 10),
(11, 'The Part Where He Kills You', 'Complete the relevant test chamber', 30),
(11, 'You Monster', 'Complete the main story', 100),
(11, 'Fratricide', 'Destroy a turret', 10),
(11, 'Bridge Over Troubling Water', 'Complete a bridge puzzle', 20),
(11, 'White Gel', 'Use propulsion gel', 20),
(11, 'Final Transmission', 'Complete the final test', 40),
(11, 'The Reunion', 'Complete the cooperative campaign', 75);


-- =========================================================
-- USER ACHIEVEMENTS
-- =========================================================

INSERT INTO UserAchievements
(UserID, AchievementID, UnlockDate) VALUES

-- Emma
(1, 1, '2026-06-01'),
(1, 2, '2026-06-02'),
(1, 4, '2026-06-03'),
(1, 6, '2026-06-05'),
(1, 9, '2026-06-06'),
(1, 10, '2026-06-08'),
(1, 17, '2026-06-10'),
(1, 22, '2026-06-12'),

-- Sebastian
(2, 1, '2026-06-01'),
(2, 3, '2026-06-04'),
(2, 5, '2026-06-05'),
(2, 9, '2026-06-07'),
(2, 11, '2026-06-09'),
(2, 14, '2026-06-11'),
(2, 18, '2026-06-13'),
(2, 25, '2026-06-15'),

-- Liam
(3, 7, '2026-06-06'),
(3, 8, '2026-06-07'),
(3, 12, '2026-06-08'),
(3, 13, '2026-06-09'),
(3, 15, '2026-06-11'),
(3, 19, '2026-06-14'),
(3, 21, '2026-06-16'),

-- Olivia
(4, 1, '2026-06-01'),
(4, 2, '2026-06-02'),
(4, 3, '2026-06-05'),
(4, 16, '2026-06-07'),
(4, 17, '2026-06-09'),
(4, 29, '2026-06-11'),
(4, 32, '2026-06-13'),

-- Noah
(5, 4, '2026-06-02'),
(5, 5, '2026-06-03'),
(5, 6, '2026-06-08'),
(5, 20, '2026-06-10'),
(5, 21, '2026-06-12'),
(5, 37, '2026-06-14'),
(5, 41, '2026-06-16'),

-- Ava
(6, 7, '2026-06-06'),
(6, 8, '2026-06-07'),
(6, 9, '2026-06-10'),
(6, 22, '2026-06-12'),
(6, 24, '2026-06-15'),
(6, 45, '2026-06-17'),
(6, 48, '2026-06-18'),

-- Lucas
(7, 10, '2026-06-04'),
(7, 11, '2026-06-06'),
(7, 12, '2026-06-09'),
(7, 25, '2026-06-11'),
(7, 27, '2026-06-14'),
(7, 53, '2026-06-16'),
(7, 55, '2026-06-18'),

-- Sophia
(8, 13, '2026-06-05'),
(8, 14, '2026-06-08'),
(8, 15, '2026-06-12'),
(8, 18, '2026-06-14'),
(8, 20, '2026-06-17'),
(8, 61, '2026-06-18'),
(8, 64, '2026-06-20'),

-- Mason
(9, 16, '2026-06-03'),
(9, 17, '2026-06-05'),
(9, 19, '2026-06-09'),
(9, 26, '2026-06-13'),
(9, 27, '2026-06-16'),
(9, 69, '2026-06-18'),
(9, 71, '2026-06-20'),

-- Isabella
(10, 18, '2026-06-04'),
(10, 19, '2026-06-07'),
(10, 20, '2026-06-11'),
(10, 22, '2026-06-15'),
(10, 24, '2026-06-18'),
(10, 73, '2026-06-19'),
(10, 76, '2026-06-21'),

-- Ethan
(11, 21, '2026-06-06'),
(11, 22, '2026-06-08'),
(11, 23, '2026-06-10'),
(11, 26, '2026-06-14'),
(11, 28, '2026-06-18'),
(11, 78, '2026-06-20'),
(11, 82, '2026-06-22');