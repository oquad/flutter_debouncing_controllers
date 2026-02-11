import 'dart:async';

import 'package:flutter/widgets.dart';

/// A simple debouncing change notifier.
class DebouncingChangeNotifier extends ChangeNotifier {
  /// The timer to notify about change.
  ///
  /// Created when [change] is called.
  /// Triggered after some [_duration] if not replaced with new timer.
  Timer? _debounceTimer;

  /// Duration of each [_debounceTimer].
  final Duration _duration;

  /// Creates a [DebouncingTextController] with some debounce [duration].
  DebouncingChangeNotifier({
    Duration duration = const Duration(milliseconds: 300),
  }) : _debounceTimer = null,
       _duration = duration;

  void change() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_duration, () => notifyListeners());
  }
}
