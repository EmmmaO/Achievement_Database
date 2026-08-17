from flask import Flask
import mysql.connector as mysql

app = Flask(__name__)

db = mysql.connect(
    host="localhost",
    user="root",
    password="waa",
    database="gamedb"
)

@app.route('/')
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/users")
def users():
    cursor = db.cursor()

    cursor.execute("SELECT * FROM users")
    results = cursor.fetchall()

    cursor.close()

    return results

if __name__ == "__main__":
    app.run(debug=True)