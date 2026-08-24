from flask import Flask, render_template

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
    return render_template("index.html")


if __name__ == "__main__":
    app.run(debug=True)