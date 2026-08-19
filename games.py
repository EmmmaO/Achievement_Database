from flask import Blueprint, request, jsonify
from database import get_db_connection

games_bp = Blueprint("games", __name__)

@games_bp.route("/games", methods=["GET"])
def get_games():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM Games")
    games = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(games)

@games_bp.route("/games", methods=["POST"])
def create_game():
    data = request.json

    game_name = data.get("GameName")
    genre = data.get("Genre")
    release_date = data.get("ReleaseDate")

    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
        INSERT INTO Games
        (GameName, Genre, ReleaseDate)
        VALUES (%s, %s, %s)
    """

    cursor.execute(
        query,
        (game_name, genre, release_date)
    )

    conn.commit()

    game_id = cursor.lastrowid

    cursor.close()
    conn.close()

    return jsonify({
        "message": "Game created",
        "GameID": game_id
    }), 201