-- =========================================================
-- ADD USERS - SAFE FOR EXISTING DATA
-- =========================================================

INSERT INTO Users (Username, Email)
SELECT 'Olivia', 'olivia@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Olivia' OR Email = 'olivia@mail.com'
);

INSERT INTO Users (Username, Email)
SELECT 'Noah', 'noah@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Noah' OR Email = 'noah@mail.com'
);

INSERT INTO Users (Username, Email)
SELECT 'Ava', 'ava@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Ava' OR Email = 'ava@mail.com'
);

INSERT INTO Users (Username, Email)
SELECT 'Lucas', 'lucas@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Lucas' OR Email = 'lucas@mail.com'
);

INSERT INTO Users (Username, Email)
SELECT 'Sophia', 'sophia@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Sophia' OR Email = 'sophia@mail.com'
);

INSERT INTO Users (Username, Email)
SELECT 'Mason', 'mason@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Mason' OR Email = 'mason@mail.com'
);

INSERT INTO Users (Username, Email)
SELECT 'Isabella', 'isabella@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Isabella' OR Email = 'isabella@mail.com'
);

INSERT INTO Users (Username, Email)
SELECT 'Ethan', 'ethan@mail.com'
WHERE NOT EXISTS (
    SELECT 1 FROM Users
    WHERE Username = 'Ethan' OR Email = 'ethan@mail.com'
);


-- =========================================================
-- ADD GAMES - SAFE FOR EXISTING DATA
-- =========================================================

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'The Witcher 3', 'RPG', '2015-05-19'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'The Witcher 3'
);

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'Celeste', 'Platformer', '2018-01-25'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'Celeste'
);

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'Stardew Valley', 'Simulation', '2016-02-26'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'Stardew Valley'
);

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'Cyberpunk 2077', 'Action RPG', '2020-12-10'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'Cyberpunk 2077'
);

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'Terraria', 'Sandbox', '2011-05-16'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'Terraria'
);

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'Hollow Knight', 'Metroidvania', '2017-02-24'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'Hollow Knight'
);

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'God of War', 'Action Adventure', '2018-04-20'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'God of War'
);

INSERT INTO Games (GameName, Genre, ReleaseDate)
SELECT 'Portal 2', 'Puzzle', '2011-04-19'
WHERE NOT EXISTS (
    SELECT 1 FROM Games WHERE GameName = 'Portal 2'
);


-- =========================================================
-- MINECRAFT - 5 NEW ACHIEVEMENTS
-- GameID is found automatically
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Getting an Upgrade' AS AchievementName,
           'Craft a better pickaxe' AS Description, 10 AS Points
    UNION ALL SELECT 'Hot Stuff', 'Fill a bucket with lava', 15
    UNION ALL SELECT 'Into the Nether', 'Enter the Nether dimension', 30
    UNION ALL SELECT 'Enchanter', 'Construct an enchantment table', 25
    UNION ALL SELECT 'Beaconator', 'Create and activate a beacon', 75
) a
WHERE g.GameName = 'Minecraft'
AND NOT EXISTS (
    SELECT 1
    FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- ELDEN RING - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Great Rune', 'Restore a Great Rune', 20
    UNION ALL SELECT 'Rennala Defeated',
        'Defeat Rennala, Queen of the Full Moon', 30
    UNION ALL SELECT 'Radahn Defeated',
        'Defeat Starscourge Radahn', 40
    UNION ALL SELECT 'Malenia Defeated',
        'Defeat Malenia, Blade of Miquella', 75
    UNION ALL SELECT 'Age of Stars',
        'Complete the Age of Stars ending', 100
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Elden Ring'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- HADES - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'First Escape', 'Escape the Underworld for the first time', 30
    UNION ALL SELECT 'Blood and Darkness', 'Unlock a weapon aspect', 15
    UNION ALL SELECT 'Boiling Blood', 'Unlock a Mirror of Night talent', 10
    UNION ALL SELECT 'Friends in High Places',
        'Reach maximum affinity with a character', 40
    UNION ALL SELECT 'Homecoming', 'Complete the main story', 100
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Hades'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- THE WITCHER 3 - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Kaer Morhen', 'Reach Kaer Morhen', 15
    UNION ALL SELECT 'Family Matters',
        'Complete the Family Matters quest', 25
    UNION ALL SELECT 'Wild Rose Dethorned',
        'Defeat a group of renegade knights', 30
    UNION ALL SELECT 'Master Marksman',
        'Kill an enemy with a crossbow from a long distance', 40
    UNION ALL SELECT 'Passed the Trial',
        'Complete the main story', 100
) a(AchievementName, Description, Points)
WHERE g.GameName = 'The Witcher 3'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- CELESTE - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Forsaken City', 'Complete Chapter 1', 10
    UNION ALL SELECT 'Old Site', 'Complete Chapter 2', 15
    UNION ALL SELECT 'Golden Feather', 'Complete a difficult challenge', 25
    UNION ALL SELECT 'Crystal Heart', 'Collect a Crystal Heart', 30
    UNION ALL SELECT 'Reflection', 'Complete Chapter 6', 40
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Celeste'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- STARDEW VALLEY - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Moving Up', 'Upgrade your house for the first time', 15
    UNION ALL SELECT 'Cook', 'Cook your first recipe', 10
    UNION ALL SELECT 'Fisherman', 'Catch 10 different fish', 20
    UNION ALL SELECT 'Millionaire', 'Earn 1,000,000 gold', 50
    UNION ALL SELECT 'Full House',
        'Upgrade your farmhouse to the maximum level', 75
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Stardew Valley'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- CYBERPUNK 2077 - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'The Rescue', 'Complete the opening mission', 10
    UNION ALL SELECT 'Automatic Love',
        'Complete the Automatic Love quest', 20
    UNION ALL SELECT 'Ripperdoc',
        'Install your first cyberware upgrade', 15
    UNION ALL SELECT 'Cyberpsycho',
        'Defeat a cyberpsycho', 30
    UNION ALL SELECT 'Legend of Night City',
        'Reach maximum street cred', 75
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Cyberpunk 2077'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- TERRARIA - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Heavy Metal', 'Obtain your first metal pickaxe', 10
    UNION ALL SELECT 'Blood Moon', 'Survive a Blood Moon event', 20
    UNION ALL SELECT 'Worm Food',
        'Summon and defeat the Eater of Worlds', 30
    UNION ALL SELECT 'Hardmode', 'Enter Hardmode', 40
    UNION ALL SELECT 'Lunar Events', 'Begin the Lunar Events', 50
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Terraria'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- HOLLOW KNIGHT - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Falsehood', 'Defeat the False Knight', 15
    UNION ALL SELECT 'Hornet Defeated', 'Defeat Hornet', 25
    UNION ALL SELECT 'Soul Master', 'Defeat the Soul Master', 35
    UNION ALL SELECT 'Dream Warrior', 'Defeat a Dream Warrior', 30
    UNION ALL SELECT 'Dream No More',
        'Complete the Dream No More ending', 100
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Hollow Knight'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- GOD OF WAR - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'A New Beginning', 'Complete the opening sequence', 10
    UNION ALL SELECT 'Worthy',
        'Fully upgrade the Leviathan Axe', 30
    UNION ALL SELECT 'Dark Elves',
        'Defeat the Dark Elf King', 25
    UNION ALL SELECT 'Like Oil and Water',
        'Complete all favors for the Dwarves', 40
    UNION ALL SELECT 'Chooser of the Slain',
        'Defeat all Valkyries', 75
) a(AchievementName, Description, Points)
WHERE g.GameName = 'God of War'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);


-- =========================================================
-- PORTAL 2 - 5 NEW ACHIEVEMENTS
-- =========================================================

INSERT INTO Achievements (GameID, AchievementName, Description, Points)
SELECT g.GameID, a.AchievementName, a.Description, a.Points
FROM Games g
JOIN (
    SELECT 'Fratricide', 'Destroy a turret', 10
    UNION ALL SELECT 'Bridge Over Troubling Water',
        'Complete a bridge puzzle', 20
    UNION ALL SELECT 'White Gel',
        'Use propulsion gel', 20
    UNION ALL SELECT 'Final Transmission',
        'Complete the final test', 40
    UNION ALL SELECT 'The Reunion',
        'Complete the cooperative campaign', 75
) a(AchievementName, Description, Points)
WHERE g.GameName = 'Portal 2'
AND NOT EXISTS (
    SELECT 1 FROM Achievements x
    WHERE x.GameID = g.GameID
    AND x.AchievementName = a.AchievementName
);