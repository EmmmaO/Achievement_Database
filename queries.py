from flask import Blueprint, request, jsonify
from database import get_db_connection

queries_bp = Blueprint("queries", __name__)

@queries_bp.route("/users/<int:user_id>/achievements", methods=["GET"])
def user_achievements(user_id):

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT
            u.Username,
            g.GameName,
            a.AchievementName,
            ua.UnlockDate
        FROM Users u
        JOIN UserAchievements ua
            ON u.UserID = ua.UserID
        JOIN Achievements a
            ON ua.AchievementID = a.AchievementID
        JOIN Games g
            ON a.GameID = g.GameID
        WHERE u.UserID = %s
        ORDER BY ua.UnlockDate
    """

    cursor.execute(query, (user_id,))
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(results)

@queries_bp.route(
    "/users/<int:user_id>/achievement-count",
    methods=["GET"]
)
def achievement_count(user_id):

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT
            u.Username,
            COUNT(ua.AchievementID) AS UnlockedAchievements
        FROM Users u
        LEFT JOIN UserAchievements ua
            ON u.UserID = ua.UserID
        WHERE u.UserID = %s
        GROUP BY u.UserID
    """

    cursor.execute(query, (user_id,))
    result = cursor.fetchone()

    cursor.close()
    conn.close()

    if result is None:
        return jsonify({
            "error": "User not found"
        }), 404

    return jsonify(result)

@queries_bp.route("/achievements/search", methods=["GET"])
def search_achievements():

    search = request.args.get("q", "")

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
        JOIN Games g
            ON a.GameID = g.GameID
        WHERE a.AchievementName LIKE %s
           OR a.Description LIKE %s
    """

    search_value = "%" + search + "%"

    cursor.execute(
        query,
        (search_value, search_value)
    )

    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(results)

@queries_bp.route("/leaderboard", methods=["GET"])
def leaderboard():

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT
            u.Username,
            COALESCE(SUM(a.Points), 0) AS TotalPoints
        FROM Users u
        LEFT JOIN UserAchievements ua
            ON u.UserID = ua.UserID
        LEFT JOIN Achievements a
            ON ua.AchievementID = a.AchievementID
        GROUP BY u.UserID
        ORDER BY TotalPoints DESC
    """

    cursor.execute(query)
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(results)

@queries_bp.route(
    "/users/<int:user_id>/completion",
    methods=["GET"]
)
def completion_percentage(user_id):

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT
            u.Username,
            g.GameID,
            g.GameName,

            COUNT(DISTINCT a.AchievementID)
                AS TotalAchievements,

            COUNT(DISTINCT ua.AchievementID)
                AS UnlockedAchievements

        FROM Users u

        CROSS JOIN Games g

        LEFT JOIN Achievements a
            ON g.GameID = a.GameID

        LEFT JOIN UserAchievements ua
            ON a.AchievementID = ua.AchievementID
            AND ua.UserID = u.UserID

        WHERE u.UserID = %s

        GROUP BY
            u.UserID,
            g.GameID,
            g.GameName
    """

    cursor.execute(query, (user_id,))
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    for result in results:
        total = result["TotalAchievements"]
        unlocked = result["UnlockedAchievements"]

        if total == 0:
            percentage = 0
        else:
            percentage = (unlocked / total) * 100

        result["CompletionPercent"] = round(
            percentage, 2
        )

    return jsonify(results)