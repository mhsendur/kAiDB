# kAiDB
kAiDB: A Comprehensive Database for the AI/ML Club of Sabanci University, kAi

# Project Members:
- Mustafa Harun Şendur 
- Serhan Yılmaz 
- Sadiq Qara 

# Description

The kAi AI/ML Club at Sabanci University has become a hub for enthusiasts and professionals in the fields of Artificial Intelligence and Machine Learning. As the club grows in membership and the range of activities it offers, the need for a robust and scalable database system has become paramount. The kAiDB project aims to develop a centralized database that will streamline the management of user profiles, event scheduling, attendance tracking, resource allocation for events and workshops, member communications, and a rewards system.

At its core, the kAiDB will store detailed user information, including contact details and professional links, to foster networking within the community. The database will also handle diverse event types such as seminars, workshops, and project meetings, each with unique attributes and requirements. A particular focus will be on maintaining attendance records to facilitate active participation and engagement tracking.
Resources such as reading materials, videos, and tools will be cataloged and linked to specific events and users, promoting an environment of continuous learning and sharing. Additionally, the database will manage member applications, storing application details and statuses to streamline the member onboarding process.

Furthermore, the kAiDB will incorporate a chat history module to preserve the knowledge exchange between members and ChatSU, and a rewards module to incentivize active participation within the club. The rewards module will be tied to a store where members can redeem points for items, creating a vibrant club economy.
Overall, the kAiDB is not just a database; it's a tool to empower the kAi club's operations, enhance member experience, and nurture the kAi community at Sabanci University.

# ER Model

<img width="1558" alt="Screenshot 2024-01-27 at 18 10 42" src="https://github.com/mhsendur/kAiDB/assets/120842010/91bbc22f-e4e3-4ba3-a69f-fdbca908ba66">

# Entities and Attributes:
1. User:
○ UserID (Primary Key)
○ FirstName
○ LastName
○ Email (Unique)
○ PhoneNumber
○ LinkedInLink
○ GitHubLink
○ DateJoined
○ MembershipStatus
  2. Event (Superclass):
○ EventID (Primary Key)
○ Name
○ Description
○ EventDate
○ Location
○ Time
3. Seminar (Subclass of Event):
○ EventID (Primary Key, Foreign Key)
○ Speaker
○ Topic
4. Workshop (Subclass of Event):
○ EventID (Primary Key, Foreign Key) ○ WorkshopDetails
5. Project (Subclass of Event):
○ EventID (Primary Key, Foreign Key)
○ Budget
○ Deadline
6. MemberApplication:
○ ApplicationID (Primary Key)
○ UserID (Foreign Key)
○ ApplicationDate
○ ApplicationStatus
7. MemberChatHistory:
○ UserID (Foreign Key)
○ History
○ ChatDate
 8. Points:
○ RewardID (Primary Key)
○ UserID (Foreign Key)
○ PointsEarned
○ PointsSpent
○ LastUpdated
9. Item (for rewards store):
○ ItemID (Primary Key)
○ Name
○ Description
○ PointsCost

# Relationships:
1. Attends:
○ AttendanceID (Primary Key)
○ EventID (Foreign Key)
○ UserID (Foreign Key)
○ AttendanceDate
AttendanceStatus-A user can attend multiple events, and an event can have multiple attendees.
-Cardinality: Many-to-Many
-Implementation: Attendance table with UserID and EventID as foreign keys.
2. EventtoSeminar/Workshop/Project(IS-ARelationship)
-An event can be a seminar, workshop, or project, but each seminar, workshop, and project is specifically one event.
-Cardinality: One-to-One
-Implementation: EventID in Seminar, Workshop, and Project tables as a primary key and foreign key referencing Event.
 3. AcceptedBy
- Each user can submit a single member application, and each application is submitted by one user.
-Cardinality: One-to-One
-Implementation: UserID as a foreign key in the MemberApplication table.
4. Stores
-Each user has a single entry in the chat history, and each chat history entry is associated with one user.
-Cardinality: One-to-One
-Implementation: UserID as a foreign key in the ChatHistory table.
5. Collects
-A user can have only one points record which tracks their points earned and spent.
-Cardinality: One-to-One
-Implementation: UserID as a foreign key in the Reward table.
6. Purchases
○ PurchaseTransactionID (Primary Key)
○ UserID (Foreign Key)
○ ItemID (Foreign Key)
○ PurchaseTransactionDate
-A user can redeem points for multiple items, and an item can be redeemed by multiple users.
-Cardinality: Many-to-Many
-Implementation: Transaction table with UserID and ItemID as foreign keys.
7. Updates
-A reward record is related to multiple transactions when points are spent, and each transaction affects one reward record.
-Cardinality: One-to-Many
-Implementation: Implicit relationship via UserID in Reward and Transaction tables.
