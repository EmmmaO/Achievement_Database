from flask import Blueprint, request, jsonify, redirect
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

@games_bp.route("/games/<int:game_id>", methods=["GET"])
def game_page(game_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM Games WHERE GameID = %s",
        (game_id,)
    )

    game = cursor.fetchone()

    cursor.close()
    conn.close()

    if game is None:
        return "Game not found", 404

    return f"""
        <h1>{game["GameName"]}</h1>
        <p>Genre: {game["Genre"]}</p>
        <p>Release Date: {game["ReleaseDate"]}</p>
        <p>Game ID: {game["GameID"]}</p>

        <a href="/">Back to home</a>
    """

@games_bp.route("/games/add", methods=["POST"])
def add_game():
    game_name = request.form["GameName"]
    genre = request.form["Genre"]
    release_date = request.form["ReleaseDate"]

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(
        """
        INSERT INTO Games
        (GameName, Genre, ReleaseDate)
        VALUES (%s, %s, %s)
        """,
        (game_name, genre, release_date)
    )

    conn.commit()

    cursor.close()
    conn.close()

    return redirect("/")