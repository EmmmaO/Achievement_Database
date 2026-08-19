from flask import Blueprint, request, jsonify
from database import get_db_connection

users_bp = Blueprint("users", __name__)

@users_bp.route("/users", methods=["GET"])
def get_users():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM Users")
    users = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(users)

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