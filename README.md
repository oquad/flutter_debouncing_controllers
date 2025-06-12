# flutter_debouncing_controllers

Debouncing variants of flutter controllers.

All controllers are intended to be drop-in replacements:

```dart
/// before:
final textController = TextController()
  ..addListener(_onTextChange);

/// after:
final textController = DebouncingTextController()
  ..addListener(_onTextChange);
```

```dart
/// before:
final searchController = SearchController()
  ..addListener(_onSearchChange);

/// after:
final searchController = DebouncingSearchController()
  ..addListener(_onSearchChange);
```
