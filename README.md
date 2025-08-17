# Thmanyah iOS App

An iOS application built with **SwiftUI** and a **Clean MVVM Architecture**, providing home and search functionality with modular layers and test coverage.

---

## Architecture

This project follows **Clean Architecture with MVVM (Model-View-ViewModel)**:

- **Domain Layer**
  - Defines core business logic and entities.
  - Contains **Use Cases** that orchestrate application rules.
  - Protocols define contracts (e.g. `IFetchHomeSectionsUseCase`).

- **Data Layer**
  - Responsible for fetching and parsing data from APIs.
  - Implements repository interfaces defined in the domain layer.
  - Handles DTOs (`PodcastItemDTO`, `EpisodeItemDTO`, `SectionItemDTO`, etc.) and mapping to domain models.

- **Presentation Layer**
  - SwiftUI views for UI (`HomeView`, `SearchView`, `SquareCardView`, etc.).
  - ViewModels (`HomeViewModel`, `SearchViewModel`) expose `@Published` states and handle interaction with use cases.
  - Uses Combine and Swift Concurrency (`async/await`).

---

## Features

- **Home Screen**
  - Loads paginated sections (Podcasts, Episodes, Audio Books, Articles).
  - Supports infinite scroll (`loadMoreSections`).

- **Search Screen**
  - Debounced search (200ms delay after typing).
  - Fetches and displays sections dynamically.
  - Loading and error states.

- **Tab Bar**
  - Main navigation between **Home** and **Search**.

- **Dynamic Layouts**
  - Supports multiple layouts (`Square`, `Big Square`, `Queue`, `Two Lines Grid`).
  - Random fallback layout for unknown types.

---

## Testing

Unit tests are included for:

- **ViewModels**
- **Use Cases**

### Mocking Strategy
- **Mocks**: Provide full fake implementations of repositories/use cases (simulate success/failure).
  
---

## Requirements
- iOS Deployment Target: **18.5**
- Xcode: **16.4+**
- Swift: **6.0**
- Combine, Swift Concurrency (async/await)

---

## 🚀 Setup

1. Clone repo
2. Open `.xcodeproj` in Xcode
3. Run on Simulator or Device
4. Run tests with **⌘ + U**
