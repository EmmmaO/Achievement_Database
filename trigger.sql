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