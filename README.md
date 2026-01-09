Apk Download link - https://drive.google.com/file/d/1nE7s-ZF-r_sPTLrpZywvK3oYMMr9zacO/view?usp=drivesdk
 
 
 
 Firebase Setup & Firebase Configuration Steps
Create a new project in the Firebase Console.
Add an Android device based on project requirements.
Enter the Package Name (Application ID) of your Android app
(You can find this in your Android project configuration).
Download the google-services.json file and place it inside:
Copy code
android/app/


Navigate to Authentication:
Click Get Started
Enable Email/Password sign-in method.
Go to Firestore Database:
Create a database in Test Mode (for development).
Configure Firestore Rules based on project requirements.
Create Indexes:
Select the required collection
Choose fields (e.g., createdAt, email)
Set sorting order (Ascending / Descending) as needed.
Initialize Firebase in the main() function and add required dependencies in:
pubspec.yaml


👤 Authentication Features
Implemented User Registration and Login screens.
New users can register using Email & Password.
Existing users can log in using the same credentials.
Authentication is handled using Firebase Authentication.
Successful login redirects the user to the Home Screen.
📝 Task Management Features
Users can Add Tasks after logging in.
Added tasks appear in the Pending Tasks section.
Tasks can be:
✏️ Edited
🗑 Deleted
📤 Shared with other users using their Email Address
Shared tasks:
Can be edited or deleted by other users as well.


✅ Task Completion
Completed tasks can be moved to the Completed Tasks section.
Helps users clearly differentiate between:
Pending Tasks
Completed Tasks
🛠️ Technologies Used
Flutter
Firebase Authentication
Cloud Firestore
Firebase Indexing
