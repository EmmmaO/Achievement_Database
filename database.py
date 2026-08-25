import mysql.connector as mysql

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "1234",
    "database": "achievementdatabase"
}

def get_db_connection():
    return mysql.connect(**DB_CONFIG)