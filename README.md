# DilettaTest - Johnny Fagundes

This is a Flutter-based wishlist application that demonstrates the use of state management, localization, dependency injection, local storage, and more. The app connects to the [Fake Store API](https://fakestoreapi.com/) to retrieve products, allowing users to manage a wishlist.

## Features

- **View Products**: Browse a list of products retrieved from the Fake Store API.
- **Add to Wishlist**: Add items to the wishlist.
- **Remove from Wishlist**: Remove individual items from the wishlist.
- **Clear Wishlist**: Clear all items from the wishlist.

## Technologies Used

### 1. State Management
- **ValueNotifier**: Used to manage the state of the wishlist efficiently and notify listeners when the state changes.

### 2. Localization (L10n)
- **L10n with Flutter**: Added support for localization, with both English and Portuguese (`en`, `pt_BR`). This allows the app to switch between these languages seamlessly.

### 3. Dependency Injection
- **GetIt**: Used as a service locator for dependency injection, making the app modular and testable.

### 4. Local Storage
- **Hive**: Used to persist wishlist data locally on the device.

### 5. Networking
- **Dio**: Used for making HTTP requests to the [Fake Store API](https://fakestoreapi.com/).

### 6. Testing
- **Mockito**: Unit tests for the application are written using the Mockito package to mock dependencies and test the ViewModel logic.