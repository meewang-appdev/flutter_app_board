# iriver_app_board

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Flask Web Server (Backend)<br>
Role: Handles all core logic, including database management, user authentication, and providing the API.<br>
<br>
/python-board-app/<br>
├── app/<br>
│   ├── __init__.py         # Creates the Flask app, initializes blueprints and extensions.<br>
│   ├── models.py         # Database models (e.g., User, Post, Board).<br>
│   ├── static/           # Static files like CSS, JavaScript, etc.<br>
│   ├── templates/        # HTML template files.<br>
│   └── views/<br>
│       ├── main_views.py   # Logic for the website.<br>
│       ├── auth_views.py   # Logic for web authentication.<br>
│       ├── admin_views.py  # Logic for the admin page.<br>
│       └── api_views.py    # REST API logic for the mobile app.<br>
│<br>
├── migrations/           # Database schema migration history.<br>
├── venv/                 # Python virtual environment.<br>
├── config.py             # Application configuration file.<br>
├── wsgi.py               # Entry point for Gunicorn execution.<br>
└── requirements.txt      # List of required libraries.<br>
<br>
<br>
Flutter Mobile App (Frontend)<br>
Role: Renders the user interface (GUI) and handles user input by consuming the API provided by the server.<br>
Architecture: Clean Architecture<br>
<br>
/flutter_board_app/<br>
├── lib/<br>
│   ├── data/                 # Data Layer: Handles API communication and local storage.<br>
│   │   ├── datasources/    # - Defines and implements remote/local data sources.<br>
│   │   ├── models/         # - Data models for API responses (JSON serialization).<br>
│   │   └── repositories/   # - Implementation of the Domain Repository interfaces.<br>
│   │<br>
│   ├── domain/               # Domain Layer: Contains the core business logic.<br>
│   │   ├── entities/       # - Core data objects of the app (used directly in the UI).<br>
│   │   │   ├── repositories/   # - Abstract interfaces for communicating with the Data Layer.<br>
│   │   └── usecases/       # - Business logic for specific features (use cases).<br>
│   │<br>
│   ├── presentation/         # Presentation Layer: Manages UI and state.<br>
│   │   ├── providers/      # - Riverpod providers for state management.<br>
│   │   ├── screens/        # - Widgets that compose each screen.<br>
│   │   └── router/         # - GoRouter setup for navigation management.<br>
│   │<br>
│   └── main.dart             # App entry point.<br>
│<br>
├── android/                  # Android platform-specific files.<br>
├── ios/                      # iOS platform-specific files.<br>
└── pubspec.yaml              # Project metadata and list of required libraries (dependencies).<br>
