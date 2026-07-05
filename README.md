# Hipster Assessment – Amazon Chime Video Calling

## Overview

This project implements a video calling application in Flutter using Amazon Chime APIs. The application follows **Clean Architecture** principles with **Riverpod** for state management, ensuring a scalable, maintainable, and testable codebase.

The application communicates with the backend to create or join Amazon Chime meetings, parses the meeting details, and attempts to initialize the native meeting session.

---

# Project Architecture

The project is organized using Clean Architecture with clear separation of responsibilities:

* **Presentation Layer**

    * Screens
    * Riverpod Providers
    * State Notifiers
    * UI State Management

* **Data Layer**

    * Repository
    * API Client (Dio)
    * Models
    * JSON Serialization

* **Core Layer**

    * Routing (GoRouter)
    * Network Handling
    * Error Handling
    * Utility Classes

---

# Technologies Used

* Flutter
* Riverpod (State Management)
* Dio (REST API)
* GoRouter (Navigation)
* json_serializable
* Freezed Annotations
* Amazon Chime Meeting APIs
* flutter_amazon_chime (Native Wrapper)

---

# Implemented Features

## Architecture

* ✅ Clean Architecture
* ✅ Riverpod State Management
* ✅ StateNotifier-based business logic
* ✅ Repository Pattern
* ✅ GoRouter Navigation
* ✅ Centralized API handling
* ✅ JSON Serialization using `json_serializable`

---

## Meeting Flow

Implemented the following workflow:

1. Create Meeting
2. Join Existing Meeting
3. Parse complete Meeting Response
4. Store Meeting State using Riverpod
5. Navigate to Meeting Screen
6. Initialize Amazon Chime Session

---

## API Integration

Successfully integrated:

* ✅ Create Meeting API
* ✅ Join Meeting API

The backend returns:

* Meeting
* Attendee
* Media Placement
* Meeting Features
* Capabilities
* Join Token

All response models are implemented and parsed successfully.

---

# State Management

The application uses **Riverpod** for state management.

Implemented using:

* StateNotifier
* Immutable MeetingState
* Provider-based dependency injection

State includes:

* Loading
* Connected
* Disconnected
* Error handling
* Meeting details
* Event logs

---

# Application Flow

1. User taps **Create Meeting**
2. Backend creates Amazon Chime Meeting
3. Flutter receives meeting response
4. Response is mapped into models
5. Riverpod updates application state
6. User is navigated to Meeting Screen
7. Amazon Chime initialization starts

---

# Current Blocker

The backend integration completes successfully, and the application reaches the native Amazon Chime initialization stage.

However, the native meeting session never becomes active.

Observed runtime logs include:

* `Devices available: []`
* `Failed to get initial audio device`
* `Mute returned false`

Because the meeting never becomes active, the meeting screen remains in the loading state.

---

# Investigation Performed

Verified the following:

* ✅ Backend API is working correctly.
* ✅ Meeting creation succeeds.
* ✅ Join meeting succeeds.
* ✅ Meeting response is parsed correctly.
* ✅ JoinToken is received.
* ✅ Meeting ID is received.
* ✅ Attendee ID is received.
* ✅ Navigation works correctly.
* ✅ Camera permission granted.
* ✅ Microphone permission granted.
* ✅ Riverpod state updates correctly.
* ✅ Meeting Screen opens successfully.
* ✅ Native Chime initialization is invoked.

The issue occurs after the Flutter application hands over control to the native Chime plugin.

---

# Root Cause Analysis

The current implementation uses:

`flutter_amazon_chime: ^0.1.2`

The backend integration functions correctly, but the third-party Flutter wrapper fails during native meeting initialization.

Based on the investigation, the blocker appears to be inside the native plugin rather than in:

* Flutter application code
* Riverpod implementation
* API integration
* Backend meeting creation

---

# Planned Next Step

To eliminate dependency on the third-party wrapper, the next implementation approach would be:

* Integrate the official Amazon Chime Android SDK using Platform Channels.
* Integrate the official Amazon Chime iOS SDK using Platform Channels.
* Expose native meeting APIs to Flutter.
* Replace the existing `flutter_amazon_chime` package with the official SDK implementation.

This approach would provide improved stability, better SDK support, and full access to Amazon Chime features.

---

# Project Status

| Module                      | Status                                  |
| --------------------------- | --------------------------------------- |
| Clean Architecture          | ✅ Completed                             |
| Riverpod State Management   | ✅ Completed                             |
| Repository Pattern          | ✅ Completed                             |
| API Integration             | ✅ Completed                             |
| Meeting Creation            | ✅ Completed                             |
| Meeting Joining             | ✅ Completed                             |
| JSON Model Parsing          | ✅ Completed                             |
| Navigation                  | ✅ Completed                             |
| Permission Handling         | ✅ Completed                             |
| Native Chime Initialization | ⚠️ Blocked by third-party plugin        |
| Audio/Video Communication   | Pending official native SDK integration |
