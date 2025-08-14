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

Flask Web Server (Backend)
Role: Handles all core logic, including database management, user authentication, and providing the API.

/python-board-app/
├── app/
│   ├── __init__.py         # Creates the Flask app, initializes blueprints and extensions.
│   ├── models.py         # Database models (e.g., User, Post, Board).
│   ├── static/           # Static files like CSS, JavaScript, etc.
│   ├── templates/        # HTML template files.
│   └── views/
│       ├── main_views.py   # Logic for the website.
│       ├── auth_views.py   # Logic for web authentication.
│       ├── admin_views.py  # Logic for the admin page.
│       └── api_views.py    # REST API logic for the mobile app.
│
├── migrations/           # Database schema migration history.
├── venv/                 # Python virtual environment.
├── config.py             # Application configuration file.
├── wsgi.py               # Entry point for Gunicorn execution.
└── requirements.txt      # List of required libraries.
Flutter Mobile App (Frontend)
Role: Renders the user interface (GUI) and handles user input by consuming the API provided by the server.
Architecture: Clean Architecture

/flutter_board_app/
├── lib/
│   ├── data/                 # Data Layer: Handles API communication and local storage.
│   │   ├── datasources/    # - Defines and implements remote/local data sources.
│   │   ├── models/         # - Data models for API responses (JSON serialization).
│   │   └── repositories/   # - Implementation of the Domain Repository interfaces.
│   │
│   ├── domain/               # Domain Layer: Contains the core business logic.
│   │   ├── entities/       # - Core data objects of the app (used directly in the UI).
│   _   │   ├── repositories/   # - Abstract interfaces for communicating with the Data Layer.
│   │   └── usecases/       # - Business logic for specific features (use cases).
│   │
│   ├── presentation/         # Presentation Layer: Manages UI and state.
│   │   ├── providers/      # - Riverpod providers for state management.
│   │   ├── screens/        # - Widgets that compose each screen.
│   │   └── router/         # - GoRouter setup for navigation management.
│   │
│   └── main.dart             # App entry point.
│
├── android/                  # Android platform-specific files.
├── ios/                      # iOS platform-specific files.
└── pubspec.yaml              # Project metadata and list of required libraries (dependencies).
