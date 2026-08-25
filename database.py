import mysql.connector as mysql

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "",
    "database": "achievementdatabase"
}

def get_db_connection():
    return mysql.connect(**DB_CONFIG)