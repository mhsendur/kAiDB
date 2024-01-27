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

1. **User**
   - UserID (Primary Key)
   - FirstName
   - LastName
   - Email (Unique)
   - PhoneNumber
   - LinkedInLink
   - GitHubLink
   - DateJoined
   - MembershipStatus

2. **Event (Superclass)**
   - EventID (Primary Key)
   - Name
   - Description
   - EventDate
   - Location
   - Time

3. **Seminar (Subclass of Event)**
   - EventID (Primary Key, Foreign Key)
   - Speaker
   - Topic

4. **Workshop (Subclass of Event)**
   - EventID (Primary Key, Foreign Key)
   - WorkshopDetails

5. **Project (Subclass of Event)**
   - EventID (Primary Key, Foreign Key)
   - Budget
   - Deadline

6. **MemberApplication**
   - ApplicationID (Primary Key)
   - UserID (Foreign Key)
   - ApplicationDate
   - ApplicationStatus

7. **MemberChatHistory**
   - UserID (Foreign Key)
   - History
   - ChatDate

8. **Points**
   - RewardID (Primary Key)
   - UserID (Foreign Key)
   - PointsEarned
   - PointsSpent
   - LastUpdated

9. **Item (for rewards store)**
   - ItemID (Primary Key)
   - Name
   - Description
   - PointsCost

# Relationships:
1. **Attends**
   - AttendanceID (Primary Key)
   - EventID (Foreign Key)
   - UserID (Foreign Key)
   - AttendanceDate
   - AttendanceStatus
   - Cardinality: Many-to-Many
   - Implementation: Attendance table with UserID and EventID as foreign keys.

2. **Event to Seminar/Workshop/Project (IS-A Relationship)**
   - EventID (Primary Key, Foreign Key)
   - Seminar: Speaker, Topic
   - Workshop: WorkshopDetails
   - Project: Budget, Deadline
   - Cardinality: One-to-One
   - Implementation: EventID in Seminar, Workshop, and Project tables as a primary key and foreign key referencing Event.

3. **AcceptedBy**
   - UserID (Foreign Key)
   - ApplicationID (Primary Key)
   - Cardinality: One-to-One
   - Implementation: UserID as a foreign key in the MemberApplication table.

4. **Stores**
   - UserID (Foreign Key)
   - ChatHistory: History, ChatDate
   - Cardinality: One-to-One
   - Implementation: UserID as a foreign key in the ChatHistory table.

5. **Collects**
   - UserID (Foreign Key)
   - PointsEarned, PointsSpent, LastUpdated
   - Cardinality: One-to-One
   - Implementation: UserID as a foreign key in the Reward table.

6. **Purchases**
   - PurchaseTransactionID (Primary Key)
   - UserID (Foreign Key)
   - ItemID (Foreign Key)
   - PurchaseTransactionDate
   - Cardinality: Many-to-Many
   - Implementation: Transaction table with UserID and ItemID as foreign keys.

7. **Updates**
   - UserID (Foreign Key)
   - PointsEarned, PointsSpent, LastUpdated
   - Cardinality: One-to-Many
   - Implementation: Implicit relationship via UserID in Reward and Transaction tables.
  

# Further Information

## Repository Contents

In this repository, you will find Python files that enable users to interact with our system. These files facilitate the process of submitting complaints or reviews within our application.

## Complaint Submission System

We have added a complaint submission system to our application, and we have  tested and demonstrated its functionality through two primary collections: Event-Complaints and Application-Complaints.

### Key Elements

The key elements of this task include the following:

1. **Database Utilization**
   - Utilizing the database for storing and managing complaint data.

2. **Application Development**
   - Developing the necessary features and functions within our application to support complaint submission.

3. **Core Functionalities**
   - Implementing core functions that enable users to interact with the complaint submission system effectively. These functions should be designed to work seamlessly with any collection and accomplish their specified purposes.

   a. **Implement Functions for Specific Actions**
      - i.   Create a new collection for complaints.
      - ii.  Retrieve all data within a collection.
      - iii. Retrieve specific data while applying filters.
      - iv.  Insert new complaint data.
      - v.   Delete existing complaint data.
      - vi.  Update complaint data.
      
   b. **Function Flexibility**
      - Ensure that these functions can work with any collection, not limited to Event-Complaints and Application-Complaints, and achieve their intended goals efficiently.

By addressing these key elements, we aim to provide users with a seamless and efficient experience when submitting complaints through our system.


<img width="960" alt="Screenshot 2024-01-27 at 18 28 26" src="https://github.com/mhsendur/kAiDB/assets/120842010/973adede-474a-4b85-8fe2-6d4feceec192">

<img width="1082" alt="Screenshot 2024-01-27 at 18 28 56" src="https://github.com/mhsendur/kAiDB/assets/120842010/f1588b5c-935d-4bbf-8f29-cdccc187b55d">

<img width="1086" alt="Screenshot 2024-01-27 at 18 29 24" src="https://github.com/mhsendur/kAiDB/assets/120842010/99512732-300c-4b05-99b8-6cd28c9647c9">

<img width="833" alt="Screenshot 2024-01-27 at 18 29 37" src="https://github.com/mhsendur/kAiDB/assets/120842010/fb394a51-31b7-4cf5-a7e0-98c71d78b9e3">


