from flask import Blueprint, request, jsonify, redirect
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


# Website: Add user from HTML form
@users_bp.route("/users/add", methods=["POST"])
def add_user():
    username = request.form["Username"]
    email = request.form["Email"]

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

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

    cursor = conn.cursor()

    cursor.execute(
        """
        INSERT INTO Users (Username, Email)
        VALUES (%s, %s),
        (username, email)
    """
    )

    conn.commit()

    cursor.close()
    conn.close()

    return redirect("/")