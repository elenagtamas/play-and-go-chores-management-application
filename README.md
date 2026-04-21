# Play&Go: Reconnect Families Through Chores Management Smart Applications

Play&Go is a cross-platform application intended to help families reconnect through household chores by adding, removing, accepting or declining shared chores, receiving rewards, and tracking progress. The application features a straightforward and user-friendly interface.

## Features

- Google OAuth 2.0 authentication
- Household creation and joining existing households
- Profile creation and management
- Chore management
- Reward system with points and money
- Task management by room
- Feedback (feature coming soon)
- Notifications (updates coming soon)

## Frameworks

### Components:

- Frontend
- Backend
- Database
- Authentication
- Testing

### Technologies:

- Flutter (Dart)
- FastAPI (Python)
- PostgreSQL (pgAdmin 4)
- Google OAuth 2.0 + JWT
- Backend (pytest)
- Frontend (flutter_test)

## Prerequisites

Make sure you have the following installed, before you begin:

### Backend Requirements 

- Python 3.10 or higher 
- PostgreSQL (latest version)
- pip (Python package manager)

### Frontend Requirements

- Flutter SDK 3.x
- Android Studio and VS Code with Flutter extensions
- Andoid SDK (latest version)

### Google Cloud Configuration

- Google Cloud with OAuth 2.0 credentials (Firebase and Google Cloud Console)
- Web Client ID for backend               (Firebase and Google Cloud Console)
- Android Client ID for mobile app        (Firebase and Google Cloud Console)

## Installation Guide

### 1. Clone the Repository

Win + Git Bash
git clone https://github.com/elenagtamas/play-and-go-chores-management-application
cd play-and-go-chores-management-application

## Backend Setup

## 2. Create Virtual Envirotment

cd backend
python -m venv venv

 On Windows
venv\Scripts\activate

 On Mac/Linux
source venv/bin/activate

### 2.1 Install Dependencies 

cd backend
pip install -r requirements.txt

### 2.2 Configure Environment Variables

create .env file in the backend/ directory:

GOOGLE_CLIENT_ID=your_web_client_id.apps.googleusercontent.com
SECRET_KEY=your_super_secret_key_minimum_32_characters
DATABASE_URL=postgresql://username:password@localhost:5432/db

### 2.3 Set Up PostgreSQL Database

CREATE DATABASE db;
CREATE USER your_username WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE db TO your_username;

### 2.4 Run Database Migrations

python -c "from play_and_go_app.db.init_db import init_db; init_db()"

### 2.5 Start Backend Server

uvicorn play_and_go_app.main:app --reload --host 0.0.0.0 --port 8000 (running on all hosts)
to test the backend API click on the port link to open Swagger

## 3. Frontend Setup 

### 3.1 Install Flutter Dependencies

cd frontend
flutter pun get

### 3.2 Configure Google Sign-In for Android

- download google-services.json from Firebase Console
- place it in android/app/

### 3.3 Update Backend URL

- in lib/screens/login_screen.dart, update the IP address:

 For emulator
Uri.parse('http://10.0.2.2:8000/auth/google')

 For physical device (use your computer's IP)
Uri.parse('http://192.168.1.100:8000/auth/google')

### 3.4 Run the App

 For emulator
flutter run

 For specific device
flutter run -d "Device Name"

 Build APK
flutter build apk --debug