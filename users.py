from flask import Blueprint, json, request, jsonify, redirect, render_template
from database import get_db_connection

users_bp = Blueprint("users", __name__)


# API: Get all users
@users_bp.route("/users", methods=["GET"])
def get_users():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM Users")
    users = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(users)


# API: Create user using JSON
@users_bp.route("/users", methods=["POST"])
def create_user():
    data = request.json

    username = data.get("Username")
    email = data.get("Email")

    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
        INSERT INTO Users (Username, Email)
        VALUES (%s, %s)
    """

    cursor.execute(query, (username, email))
    conn.commit()

    user_id = cursor.lastrowid

    cursor.close()
    conn.close()

    return jsonify({
        "message": "User created",
        "UserID": user_id
    }), 201


@users_bp.route("/users/<int:user_id>/uachievement", methods=["GET"])
def user_achievements(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT 
            ua.*,
            a.AchievementName,
            a.Points,
            g.GameName,
            g.GameID
          FROM Userachievements ua
            JOIN Achievements a ON ua.AchievementID = a.AchievementID
            JOIN Games g ON a.GameID = g.GameID
        WHERE UserID = %s
    """

    cursor.execute(query, (user_id,))
    achievements = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(achievements)

@users_bp.route("/users/<int:user_id>", methods=["GET"])
def user_page(user_id):
    return render_template("userpage.html", user_id=user_id)

@users_bp.route("/api/users/<int:user_id>", methods=["GET"])
def user_api(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM Users WHERE UserID = %s",
        (user_id,)
    )
    user = cursor.fetchone()

    cursor.close()
    conn.close()

    if user is None:
        return "User not found", 404

    # uachievements = user_achievements(user_id)

    return jsonify(user)


    # return f"""
    # <h2>User Page for {user['Username']}</h2>
    # <p>Email: {user['Email']}<br>
    # UserID: {user['UserID']}<br>
    # Points: {user['TotalPoints']}</p>

    # <div>
    #     <h3>Achievements Earned:</h3>
    #     <ul>
    #         {{#achievements}}
    #         <li>{{AchievementName}} (Earned on {{UnlockDate}})</li>
    #         {{/achievements}}
    #     </ul>
    # </div>
    # """;


# Website: Add user from HTML form
@users_bp.route("/users/add", methods=["POST"])
def add_user():
    username = request.form["Username"]
    email = request.form["Email"]

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Check for duplicate entries 
    cursor.execute(
        """
        SELECT UserID, Username, Email
        FROM Users
        WHERE Username = %s OR Email = %s
    """, (username, email)
    )

    existing_user = cursor.fetchone()

    if existing_user:
        cursor.close()
        conn.close()

        if existing_user["Username"] == username:
            return "Error: Username already exists", 400

        if existing_user["Email"] == email:
            return "Error: Email already exists", 400

    # Add new user
    cursor = conn.cursor()

    cursor.execute(
        """
        INSERT INTO Users (Username, Email)
        VALUES (%s, %s)
        """,
        (username, email)
    )

    conn.commit()

    cursor.close()
    conn.close()

    return redirect("/")