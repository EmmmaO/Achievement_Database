-- JOIN: user unlocked achievements
SELECT u.Username, g.GameName, a.AchievementName, ua.UnlockDate
FROM Users u
JOIN UserAchievements ua ON u.UserID = ua.UserID
JOIN Achievements a ON ua.AchievementID = a.AchievementID
JOIN Games g ON a.GameID = g.GameID
WHERE u.UserID = 1
ORDER BY ua.UnlockDate;

-- GROUP BY: count achievements per user
SELECT u.Username, COUNT(ua.AchievementID) AS UnlockedAchievements
FROM Users u
LEFT JOIN UserAchievements ua ON u.UserID = ua.UserID
WHERE u.UserID = 2
GROUP BY u.UserID;

-- SEARCH
SELECT * 
FROM Achievements 
WHERE AchievementName LIKE '%Defeated%';

-- COMPARE
SELECT u.Username, SUM(a.Points) AS TotalPoints
FROM Users u
JOIN UserAchievements ua ON u.UserID = ua.UserID
JOIN Achievements a ON ua.AchievementID = A.AchievementID
GROUP BY u.UserID
ORDER BY TotalPoints DESC;

-- COMPLETION PERCENTAGE
SELECT 
	u.Username,
	g.GameName,
    CompletionPercentage(u.UserID, g.GameID) AS CompletionPercent
    FROM Users u
    JOIN UserAchievements ua ON u.UserID = ua.UserID
    JOIN Achievements a ON ua.AchievementID = a.AchievementID
    JOIN Games g ON a.GameID = g.GameID
    GROUP BY u.UserID, g.GameID;

-- Trigger for updating User Table when UserAchievement Table has been inserted into --
DELIMITER $$
CREATE TRIGGER UpdateTotalPoints
AFTER INSERT ON UserAchievements
FOR EACH ROW
BEGIN
    UPDATE Users
    SET TotalPoints = TotalPoints +
    (
        SELECT Points
        FROM Achievements
        WHERE AchievementID = NEW.AchievementID
    )
    WHERE UserID = NEW.UserID;
END$$

DELIMITER ;
