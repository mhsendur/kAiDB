from connect import connectDB
from pymongo import errors
from bson import ObjectId
from datetime import datetime

def createCollection(db, collection_name):
    try:
        if collection_name not in db.list_collection_names():
            db.create_collection(collection_name)
            print(f"Collection '{collection_name}' created.")
        else:
            print("Collection already exists")
    except Exception as e:
        print("An error occurred: ", e)

def insert_complaint(db, collection_name, user_id, complaint_details):
    try:
        collection = db[collection_name]
        complaint_data = {
            "UserID": user_id,
            "ComplaintDetails": complaint_details,
            "ComplaintDate": datetime.now(),  # Automatically sets the current date and time
            "Status": "Open"  # Default status for a new complaint
        }
        result = collection.insert_one(complaint_data)
        print("Complaint successfully filed.")
        print(f"Complaint ID: {result.inserted_id}")
    except Exception as e:
        print(f"An error occurred: {e}")

def read_all_complaints(db, collection_name):
    try:
        collection = db[collection_name]
        result = collection.find()
        for complaint in result:
            print(complaint)
    except Exception as e:
        print(f"An error occurred: {e}")

def find_complaints_by_event(db, collection_name, event_id):
    try:
        collection = db[collection_name]
        query = {"EventID": event_id}
        cursor = collection.find(query)
        complaints = list(cursor)
        for complaint in complaints:
            print(complaint)
        return complaints
    except Exception as e:
        print(f"An error occurred: {e}")

def delete_complaint_by_id(db, collection_name, complaint_id_str):
    try:
        collection = db[collection_name]
        # Convert the string ID to ObjectId
        complaint_id = ObjectId(complaint_id_str)
        query = {"_id": complaint_id}
        result = collection.delete_one(query)
        if result.deleted_count == 1:
            print(f"Successfully deleted complaint with ID {complaint_id_str}")
        else:
            print(f"No complaint found with ID {complaint_id_str}")
    except errors.PyMongoError as e:
        print(f"An error occurred: {e}")

def update_complaint_status_by_id(db, collection_name, complaint_id_str, new_status):
    try:
        collection = db[collection_name]
        # Convert the string ID to ObjectId
        complaint_id = ObjectId(complaint_id_str)
        query = {"_id": complaint_id}
        result = collection.update_one(query, {"$set": {"Status": new_status}})
        if result.matched_count == 1:
            print(f"Successfully updated the status for complaint with ID {complaint_id_str}")
        else:
            print(f"No complaint found with ID {complaint_id_str}")
    except errors.PyMongoError as e:
        print(f"An error occurred: {e}")
    except errors.InvalidId as e:
        print(f"Invalid ID format: {e}")

def filter_complaints(db, collection_name):
    print("\nFilter Options:")
    print("1 - UserID")
    print("2 - Status")
    filter_option = input("Choose your filter option: ")
    query = {}
    if filter_option == '1':
        user_id = input("Enter UserID to filter by: ")
        query = {"UserID": user_id}
    elif filter_option == '2':
        status = input("Enter Status to filter by: ")
        query = {"Status": status}
    else:
        print("Invalid option. Returning to main menu.")
        return
    collection = db[collection_name]
    results = collection.find(query)
    for complaint in results:
        print(complaint)

def get_collections(db):
    return db.list_collection_names()

def choose_collection(db):
    collections = get_collections(db)
    print("\nAvailable Collections:")
    for i, collection in enumerate(collections, start=1):
        print(f"{i} - {collection}")
    choice = int(input("Select a collection: "))
    if choice >= 1 and choice <= len(collections):
        return collections[choice - 1]
    else:
        print("Invalid selection.")
        return None

def main_menu():
    print("\nWelcome to Complaint Portal!")
    db = connectDB()  # Establishing the database connection
    while True:
        print("\nPlease pick the option that you want to proceed.")
        print("1 - Create a collection.")
        print("2 - Read all data in a collection.")
        print("3 - Read some part of the data while filtering.")
        print("4 - Insert data.")
        print("5 - Delete data.")
        print("6 - Update data.")
        print("7 - Exit.")
        option = input("Selected option: ")
        if option == '1':
            collection_name = input("Enter the name of the collection to create: ")
            createCollection(db, collection_name)
        elif option == '2':
            collection_name = choose_collection(db)
            if collection_name:
                read_all_complaints(db, collection_name)
        elif option == '3':
            collection_name = choose_collection(db)
            if collection_name:
                filter_complaints(db, collection_name)
        elif option == '4':
            collection_name = choose_collection(db)
            if collection_name:
                user_id = input("Please enter your user id: ")
                complaint_details = input("Enter the details of your complaint: ")
                insert_complaint(db, collection_name, user_id, complaint_details)
        elif option == '5':
            collection_name = choose_collection(db)
            if collection_name:
                complaint_id = input("Enter the ID of the complaint to delete: ")
                delete_complaint_by_id(db, collection_name, complaint_id)
        elif option == '6':
            collection_name = choose_collection(db)
            if collection_name:
                complaint_id = input("Enter the ID of the complaint to update: ")
                new_status = input("Enter the new status: ")
                update_complaint_status_by_id(db, collection_name, complaint_id, new_status)
        elif option == '7':
            print("Exiting the Complaint Portal.")
            break
        else:
            print("Invalid option. Please try again.")

if __name__ == "__main__":
    main_menu()
