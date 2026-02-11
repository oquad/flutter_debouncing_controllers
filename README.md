# flutter_debouncing_controllers

Debouncing variants of flutter controllers.

Controllers that are intended to be drop-in replacements:

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

Simple change notifier:
```dart
final debouncingNotifier = DebouncingChangeNotifier()
  ..addListener(_onChange);

/// [_onChange] is called only once.
debouncingNotifier.change();
debouncingNotifier.change();
debouncingNotifier.change();
```
