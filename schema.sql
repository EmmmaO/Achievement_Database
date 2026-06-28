-- USERS
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    TotalPoints INT DEFAULT 0
);

-- GAMES
DROP TABLE IF EXISTS Games;
CREATE TABLE Games (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    GameName VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    ReleaseDate DATE
);

-- ACHIEVEMENTS
DROP TABLE IF EXISTS Achievements;
CREATE TABLE Achievements (
    AchievementID INT AUTO_INCREMENT PRIMARY KEY,
    GameID INT NOT NULL,
    AchievementName VARCHAR(100) NOT NULL,
    Description TEXT,
    Points INT NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);

-- USER ACHIEVEMENTS (ONLY UNLOCKED)
DROP TABLE IF EXISTS UserAchievements;
CREATE TABLE UserAchievements (
    UserID INT,
    AchievementID INT,
    UnlockDate DATE,
    PRIMARY KEY (UserID, AchievementID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AchievementID) REFERENCES Achievements(AchievementID)
);