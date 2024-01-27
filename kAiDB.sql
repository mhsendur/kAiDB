-- Create Database
CREATE DATABASE IF NOT EXISTS kAiDB; USE kAiDB;

-- User table
CREATE TABLE IF NOT EXISTS User (
UserID INT PRIMARY KEY AUTO_INCREMENT, FirstName VARCHAR(255) NOT NULL, LastName VARCHAR(255) NOT NULL,
Email VARCHAR(255) UNIQUE NOT NULL, PhoneNumber VARCHAR(15),
LinkedInLink VARCHAR(255),
GitHubLink VARCHAR(255),
DateJoined DATE,
MembershipStatus VARCHAR(50) DEFAULT 'Inactive', ApplicationID INT UNIQUE -- Ensures one application per
user );

-- Event Superclass table
CREATE TABLE IF NOT EXISTS Event (
EventID INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(255) NOT NULL,
Description TEXT,
EventDate DATE NOT NULL,
Location VARCHAR(255),
Time TIME );

-- Seminar Subclass (IS A Event) CREATE TABLE IF NOT EXISTS Seminar (
EventID INT PRIMARY KEY,
Speaker VARCHAR(255),
Topic VARCHAR(255),
FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

  -- Workshop Subclass (IS A Event) CREATE TABLE IF NOT EXISTS Workshop (
EventID INT PRIMARY KEY,
WorkshopDetails TEXT,
FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Project Subclass (IS A Event) CREATE TABLE IF NOT EXISTS Project (
EventID INT PRIMARY KEY,
Budget DECIMAL(10,2),
Deadline DATE,
FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Attends table for Events
CREATE TABLE IF NOT EXISTS Attends (
AttendanceID INT PRIMARY KEY AUTO_INCREMENT, EventID INT,
UserID INT,
AttendanceDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, AttendanceStatus VARCHAR(50),
FOREIGN KEY (EventID) REFERENCES Event(EventID),
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

-- MemberApplication table
CREATE TABLE IF NOT EXISTS MemberApplication (
ApplicationID INT PRIMARY KEY AUTO_INCREMENT,
UserID INT UNIQUE NOT NULL, -- Made UserID unique to enforce one application per user
ApplicationDate DATE NOT NULL,
ApplicationStatus VARCHAR(50),
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE
CASCADE );

 -- ChatHistory table
CREATE TABLE IF NOT EXISTS MemberChatHistory (
UserID INT PRIMARY KEY, -- Using UserID as the primary key
History TEXT,
ChatDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE
CASCADE );

-- Reward table
CREATE TABLE IF NOT EXISTS Reward (
RewardID INT PRIMARY KEY AUTO_INCREMENT, UserID INT NOT NULL,
PointsEarned INT DEFAULT 0,
PointsSpent INT DEFAULT 0,
LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

-- Item table (for rewards store) CREATE TABLE IF NOT EXISTS Item (
ItemID INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(255) NOT NULL, Description TEXT,
PointsCost INT NOT NULL
);

-- Purchases table (for rewards redemptions) CREATE TABLE IF NOT EXISTS Purchase (
PurchaseID INT PRIMARY KEY AUTO_INCREMENT,
UserID INT NOT NULL,
ItemID INT NOT NULL,
PurchaseDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
 FOREIGN KEY (ItemID) REFERENCES Item(ItemID) ON DELETE CASCADE
);

-- Collects table (for rewards collection) CREATE TABLE IF NOT EXISTS Collects (
PointsEarned INT,
PointsSpent INT,
LastUpdated Date,
UserID INT NOT NULL,
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE
CASCADE );

-- AcceptedBy table (for user applications) CREATE TABLE IF NOT EXISTS AcceptedBy (
UserID INT NOT NULL, ApplicationID INT NOT NULL,
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
FOREIGN KEY (ApplicationID) REFERENCES MemberApplication(ApplicationID) ON DELETE CASCADE
);

-- Stores table (for user chat history) CREATE TABLE IF NOT EXISTS Stores (
UserID INT NOT NULL,
FOREIGN KEY (UserID) REFERENCES User(UserID) ON
DELETE CASCADE );

-- AcceptedBy Updates (for updating the points a user has) CREATE TABLE IF NOT EXISTS Updates (
UserID INT NOT NULL, ItemID INT NOT NULL,
FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
FOREIGN KEY (ItemID) REFERENCES Item(ItemID) ON DELETE CASCADE
);