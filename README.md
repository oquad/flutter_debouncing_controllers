# flutter_debouncing_controllers

Debouncing variants of flutter controllers and notifiers.

Controllers that are intended to be nearly drop-in replacements:

```dart
/// before:
final textController = TextController()
  ..addListener(_onTextChange);

TextField(controller: textController);

/// after:
final debouncingController = DebouncingTextController()
  ..addListener(_onTextChange);

TextField(controller: debouncingController.textController);
```

```dart
/// before:
final searchController = SearchController()
  ..addListener(_onSearchChange);

SearchAnchor.bar(searchController: searchController, ...);

/// after:
final debouncingController = DebouncingSearchController()
  ..addListener(_onSearchChange);

SearchAnchor.bar(searchController: debouncingController.searchController, ...);
```

Useful debouncing versions of notifiers:

```dart
final debouncingNotifier = DebouncingChangeNotifier()
  ..addListener(_onChange);

/// [_onChange] is called only once.
debouncingNotifier.change();
debouncingNotifier.change();
debouncingNotifier.change();
```

```dart

final debouncingNotifier = DebouncingValueNotifier(1)
  ..addListener(_onChange);

/// [_onChange] is called only once.
debouncingNotifier.value = 2;
debouncingNotifier.value = 3;
debouncingNotifier.value = 4;
```
