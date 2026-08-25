-- USERS
INSERT INTO Users (Username, Email) VALUES
('Emma', 'emma@mail.com'),
('Sebastian', 'sebastian@mail.com'),
('Liam', 'liam@mail.com');

-- GAMES
INSERT INTO Games (GameName, Genre, ReleaseDate) VALUES
('Minecraft', 'Sandbox', '2011-11-18'),
('Elden Ring', 'RPG', '2022-02-25'),
('Hades', 'Roguelike', '2020-09-17');

-- ACHIEVEMENTS
INSERT INTO Achievements (GameID, AchievementName, Description, Points) VALUES
(1, 'First Night', 'Survive first night', 10),
(1, 'Diamond Miner', 'Mine diamond', 25),
(1, 'The End?', 'Enter End dimension', 50),

(2, 'Margit Defeated', 'Beat Margit', 20),
(2, 'Godrick Defeated', 'Beat Godrick', 30),
(2, 'Elden Lord', 'Finish game', 100),

(3, 'Escape Tartarus', 'Escape Tartarus', 20),
(3, 'Defeat Hades', 'Beat Hades', 80);

-- USER ACHIEVEMENTS
INSERT INTO UserAchievements (UserID, AchievementID, UnlockDate) VALUES
(1, 1, '2026-06-01'),
(1, 2, '2026-06-02'),
(1, 4, '2026-06-03'),

(2, 1, '2026-06-01'),
(2, 3, '2026-06-04'),
(2, 5, '2026-06-05'),

(3, 7, '2026-06-06'),
(3, 8, '2026-06-07');