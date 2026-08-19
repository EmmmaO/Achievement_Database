DELIMITER $$

CREATE FUNCTION CompletionPercentage(pUserID INT, pGameID INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
	DECLARE unlocked INT;
    DECLARE total INT;
    
    SELECT COUNT(*) 
    INTO unlocked
    FROM UserAchievements ua
    JOIN Achievements a 
        ON ua.AchievementID = a.AchievementID
    WHERE ua.UserID = pUserID 
        AND a.GameID = pGameID;
    
    SELECT COUNT(*)
    INTO total
    FROM Achievements
    WHERE GameID = pGameID;

    IF total = 0 THEN
        RETURN 0.00;
    END IF;
    
    RETURN (unlocked * 100.0) / total;
END$$

DELIMITER ;