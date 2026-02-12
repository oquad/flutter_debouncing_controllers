import 'package:flutter/widgets.dart';

import 'util/debouncing_mixin.dart';

/// A debouncing change notifier.
class DebouncingChangeNotifier extends ChangeNotifier with DebouncingMixin {
  /// Creates a [DebouncingChangeNotifier] with some debounce [duration].
  DebouncingChangeNotifier({
    Duration duration = const Duration(milliseconds: 300),
  }) {
    this.duration = duration;
  }

  @override
  void notifyListeners() {
    change(super.notifyListeners);
  }
}
