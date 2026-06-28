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

-- COMPLETION PERCENTAGE