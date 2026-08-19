from flask import Flask

from users import users_bp
from games import games_bp
from achievements import achievements_bp
from queries import queries_bp

app = Flask(__name__)

app.register_blueprint(users_bp)
app.register_blueprint(games_bp)
app.register_blueprint(achievements_bp)
app.register_blueprint(queries_bp)

@app.route("/")
def home():
    return {
        "message": "Big website is up"
    }

if __name__ == "__main__":
    app.run(debug=True)