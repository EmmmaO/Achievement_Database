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

```sql
CREATE DATABASE AchievementDatabase;
```

### Create the tables

```sql
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

CREATE TABLE Games (
    GameID INT AUTO_INCREMENT PRIMARY KEY,
    GameName VARCHAR(100) NOT NULL,
    Genre VARCHAR(100),
    ReleaseDate DATE
);

CREATE TABLE Achievements (
    AchievementID INT AUTO_INCREMENT PRIMARY KEY,
    GameID INT NOT NULL,
    AchievementName VARCHAR(255) NOT NULL,
    Description TEXT,
    Points INT NOT NULL,
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);

CREATE TABLE UserAchievements (
    UserID INT NOT NULL,
    AchievementID INT NOT NULL,
    UnlockDate DATE,
    PRIMARY KEY (UserID, AchievementID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AchievementID) REFERENCES Achievements(AchievementID)
);
```

### Configure MySQL

Update `database.py` with your MySQL credentials.

## Run

```powershell
.\.venv\Scripts\python.exe app.py
```

## Open

http://127.0.0.1:5000