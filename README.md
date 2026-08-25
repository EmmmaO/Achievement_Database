# Achievement Database

Flask + MySQL achievement database.

## Requirements

- Python 3
- MySQL
- Git

## Setup

### Clone the project

```powershell
git clone https://github.com/EmmmaO/Achievement_Database.git
cd Achievement_Database
```

### Create a virtual environment

```powershell
python -m venv .venv
```

### Install dependencies

```powershell
.\.venv\Scripts\python.exe -m pip install flask mysql-connector-python
```

## Database

### Create the database

Run the setup.sql in your graphical user interface for MySQL

### Configure MySQL

Update `database.py` with your MySQL credentials.

## Run

```powershell
.\.venv\Scripts\python.exe app.py
```

## Open

http://127.0.0.1:5000