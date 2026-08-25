import datetime
from datetime import datetime

from flask import Blueprint, redirect, request, jsonify
from database import get_db_connection

achievements_bp = Blueprint("achievements", __name__)

@achievements_bp.route("/achievements", methods=["GET"])
def get_achievements():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT
            a.AchievementID,
            a.GameID,
            g.GameName,
            a.AchievementName,
            a.Description,
            a.Points
        FROM Achievements a
        JOIN Games g ON a.GameID = g.GameID
    """

    cursor.execute(query)
    achievements = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(achievements)

@achievements_bp.route("/achievements", methods=["POST"])
def create_achievement():
    data = request.json

    game_id = data.get("GameID")
    name = data.get("AchievementName")
    description = data.get("Description")
    points = data.get("Points")

    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
        INSERT INTO Achievements
        (GameID, AchievementName, Description, Points)
        VALUES (%s, %s, %s, %s)
    """

    cursor.execute(
        query,
        (game_id, name, description, points)
    )

    conn.commit()

    achievement_id = cursor.lastrowid

    cursor.close()
    conn.close()

    return jsonify({
        "message": "Achievement created",
        "AchievementID": achievement_id
    }), 201


@achievements_bp.route("/users/<int:user_id>/achievements/<int:achievement_id>", methods=["POST"])
def unlock_achievement(user_id, achievement_id):
    data = request.form or {}
    date = datetime.now()
    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
        INSERT INTO UserAchievements
        (UserID, AchievementID, UnlockDate)
        VALUES (%s, %s, %s)
    """

    try:
        cursor.execute(
            query,
            (user_id, achievement_id, str(date))
        )

        conn.commit()

    except Exception as e:
        conn.rollback()

        cursor.close()
        conn.close()

        return jsonify({
            "error": str(e)
        }), 400

    cursor.close()
    conn.close()

    return redirect("/users/"+str(user_id))