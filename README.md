# flutter_debouncing_controllers

Debouncing variants of flutter controllers and notifiers. Nearly DROP-IN replacements!

```dart
/// before:
final textController = TextController()
  ..addListener(_onTextChange);

TextField(controller: textController);

/// after:
final debouncingController = DebouncingTextController(duration: Duration(seconds: 2))
  ..addListener(_onTextChange);

TextField(controller: debouncingController.textController);
```

```dart
/// before:
final searchController = SearchController()
  ..addListener(_onSearchChange);

SearchAnchor.bar(searchController: searchController, ...);

/// after:
final debouncingController = DebouncingSearchController() // 300 ms by default
  ..addListener(_onSearchChange);

SearchAnchor.bar(searchController: debouncingController.searchController, ...);
```

Useful debouncing versions of notifiers:

```dart
final debouncingNotifier = DebouncingChangeNotifier() // 300 ms by default
  ..addListener(_onChange);

/// [_onChange] is called only once.
debouncingNotifier.change();
debouncingNotifier.change();
debouncingNotifier.change();
```

```dart

final debouncingNotifier = DebouncingValueNotifier(1) // 300 ms by default
  ..addListener(_onChange);

/// [_onChange] is called only once.
debouncingNotifier.value = 2;
debouncingNotifier.value = 3;
debouncingNotifier.value = 4;
```
