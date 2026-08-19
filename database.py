import mysql.connector as mysql

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "waa",
    "database": "gamedb"
}

def get_db_connection():
    return mysql.connect(**DB_CONFIG)