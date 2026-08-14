# Project Structure and Architecture

- Flutter app organized by feature under `lib/features/`.
- Each feature typically follows `data/`, `bloc/`, and `view/` folders.
- Shared infrastructure and utilities live in `lib/core/`.
- Dependency injection uses `injectable` with `getIt` (`lib/injectable.dart`).
- State management uses Bloc/Cubit with Freezed for events/states and models.
- Localization uses `lib/l10n` and `AppLocalizations` via `context.l10n`.
- Assets are stored under `assets/` and referenced through generated helpers.
- Networking and API models are in `lib/network/` and feature-specific `data/` layers.
- App entry points use flavors via `lib/main_development.dart`, `lib/main_staging.dart`, and `lib/main_production.dart`.

## Core Modules

- `lib/core/app/`: app bootstrap, flavors, root app widget.
- `lib/core/router/`: AutoRoute setup, guards, route names.
- `lib/core/ui/`: shared UI kit, themes, and UI extensions.
- `lib/core/utils/`: shared utilities and mixins.

## Features

- Each feature owns its UI, state, and data access under `lib/features/<feature>/`.
- UI widgets are in `view/`, state in `bloc/`, data in `data/`.
- Models are defined with Freezed and JSON serialization in `data/models/`.

## Services

- Services are centralized in `lib/services/` (e.g., chat, deep links, notifications, sentry).
- Services are injected via `getIt` and used by blocs/cubits and repositories.

## Patterns and Conventions

- Use Bloc/Cubit for state and side effects.
- Use repositories/providers for data access and API calls.
- Keep UI in widgets and avoid widget-returning helper functions.
- Comments should be in English.
- Prefer `dart format` with 120 line length.
- Always use `make generate` command instead of `dart run build_runner build --delete-conflicting-outputs`

## API Requests/Responses

- Requests live in `lib/features/**/data/models/request/`.
- Responses live in `lib/features/**/data/models/response/`.
- Use Freezed models with JSON serialization for DTOs.
- Repositories call providers/APIs and return domain-friendly models.
- Dont Use JsonKe

## Git Rules

- Do not push until the user asks.
- Do not amend commits unless explicitly requested.
