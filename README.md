# Hipster Video Calling Experience Assessment

## Overview

This project is a Flutter-based video meeting application built as part of the Hipster assessment. The application integrates with Amazon Chime meeting APIs to create and join meetings while following a clean, modular architecture using Riverpod for state management.

The implementation focuses on maintainability, separation of concerns, and scalability while providing a responsive user interface.

---

# Features Implemented

### Meeting Management

- Create an Instant Meeting
- Schedule a Meeting (UI workflow)
- Join an existing meeting using Meeting ID
- Display created Meeting ID
- Maintain a list of scheduled meetings
- Join a scheduled meeting
- Loading indicator during API calls
- Error handling using SnackBars

### User Interface

- Responsive Home Screen
- Meeting creation options using Bottom Sheet
- Scheduled Meetings screen
- Meeting details display
- Material Design based UI

---

# Project Structure

```
lib/
│
├── core/
│   ├── network/
│   ├── routes/
│   └── utils/
│
├── features/
│   └── meeting/
│       ├── data/
│       │   ├── api/
│       │   ├── models/
│       │   ├── repository/
│       │   └── mappers/
│       │
│       ├── presentation/
│       │   ├── screens/
│       │   └── widgets/
│       │
│       └── providers/
│
└── main.dart
```

The project follows feature-first organization where each feature contains its own presentation, business logic, repository, and models.

---

# Setup Instructions

## 1. Clone the repository

```bash
git clone <repository_url>
```

---

## 2. Install packages

```bash
flutter pub get
```

---

## 3. Generate model files

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 4. Configure Environment

Create a `.env` file in the project root and configure the required API endpoint.

Example:

```
BASE_URL=https://assess.hipster-dev.com/api
```

---

## 5. Run the application

```bash
flutter run
```

---

# State Management

This project uses **Riverpod**.

Riverpod is responsible for:

- Managing application state
- API request handling
- Loading state
- Error state
- Meeting state
- Scheduled meetings list
- Navigation triggers

The main provider is:

```
MeetingNotifier
```

which exposes a `MeetingState` object containing:

- Current Meeting
- Meeting Token Response
- Loading Status
- Connection Status
- Scheduled Meetings
- Event Logs
- Error Messages

---

# Architecture Overview

The application follows a layered architecture.

```
Presentation Layer
        │
        ▼
Riverpod StateNotifier
        │
        ▼
Repository Layer
        │
        ▼
API Service
```

### Presentation

Responsible for:

- UI
- User interactions
- Navigation

### State Layer

`MeetingNotifier`

Responsible for:

- Business logic
- Calling repository methods
- Managing loading/error state
- Updating UI state

### Repository

Responsible for:

- API communication
- Parsing API responses
- Returning Result objects

### Models

Separate models are maintained for different API responses.

- MeetingResponse
- MeetingTokenResponse
- ScheduledMeeting

---

# API Flow

## Create Meeting

```
User
    │
    ▼
Create Meeting
    │
    ▼
Meeting API
    │
    ▼
MeetingResponse
    │
    ▼
Riverpod State
    │
    ▼
Navigate to Meeting Screen
```

---

## Join Meeting

```
User
    │
    ▼
Enter Meeting ID
    │
    ▼
Join API
    │
    ▼
MeetingTokenResponse
    │
    ▼
Combine with existing Meeting information
    │
    ▼
Create JoinInfo
    │
    ▼
Meeting Screen
```

---

# Assumptions Made

- Meeting creation is performed by an Agent.
- Client joins using an existing Meeting ID.
- Scheduled meetings are currently maintained in application state only.
- The backend is responsible for generating Meeting IDs and attendee tokens.
- Navigation occurs only after successful API responses.
- The assessment API responses were considered as the source of truth.

---

# Development Approach

The implementation was completed in multiple stages.

### Stage 1

- Project setup
- Folder structure
- Riverpod integration
- Routing using GoRouter
- API layer
- Repository pattern

### Stage 2

- Create Meeting implementation
- Join Meeting implementation
- JSON models
- Response parsing

### Stage 3

- Meeting screen integration
- Amazon Chime package integration
- JoinInfo mapping
- Navigation flow

### Stage 4

- UI improvements
- Bottom sheet for meeting options
- Instant Meeting
- Scheduled Meeting workflow
- Scheduled Meetings screen

### Stage 5

- Error handling
- Loading indicators
- Snackbar notifications
- Event logging

---

# Challenges Encountered

During implementation, the following challenges were identified.

### Amazon Chime Flutter Package

The current Flutter package (`flutter_amazon_chime`) initializes successfully but does not complete the meeting connection.

Observed behavior:

- Meeting API succeeds.
- JoinInfo is generated correctly.
- Meeting screen opens.
- Chime SDK remains in loading state.
- Audio devices are not initialized.
- Mute operation returns `ChimeException`.

### API Response Differences

The Create Meeting API returns the complete meeting information including:

- MediaPlacement
- MediaRegion
- ExternalMeetingId

Whereas the Join Meeting API returns only:

- MeetingId
- Attendee Token

To support this, separate response models were introduced:

- MeetingResponse
- MeetingTokenResponse

The application combines the stored meeting details with the attendee token to construct the required `JoinInfo`.

---

# Known Limitations

- Scheduled meetings are stored in memory and are not persisted across application restarts.
- Calendar scheduling functionality is currently represented as a UI workflow and does not integrate with a backend scheduler.
- Due to limitations observed with the current Flutter Amazon Chime package, successful meeting initialization could not be fully verified despite receiving valid API responses.
- The implementation currently focuses on the meeting lifecycle, state management, and API integration rather than advanced conferencing features.

---

# Technologies Used

- Flutter
- Dart
- Riverpod
- GoRouter
- Dio
- Freezed
- JSON Serializable
- Amazon Chime Flutter SDK
- Logger

---

# Future Improvements

- Native Amazon Chime SDK integration for Android and iOS using Platform Channels.
- Persist scheduled meetings using local storage (Hive/SQLite).
- Calendar integration for scheduled meetings.
- Push notifications for upcoming meetings.
- Meeting history.
- Authentication and user profile management.
- Unit and widget tests.
- Improved meeting analytics and event tracking.

---

## Conclusion

The assessment demonstrates a complete Flutter application architecture with Riverpod-based state management, clean separation of concerns, repository pattern, API integration, responsive UI, and meeting workflow implementation. While the meeting lifecycle and API interactions have been successfully implemented, the final media connection is currently limited by the behavior of the available Flutter Amazon Chime package. The codebase has been structured to support future replacement with native Amazon Chime SDK integration with minimal changes to the application architecture.