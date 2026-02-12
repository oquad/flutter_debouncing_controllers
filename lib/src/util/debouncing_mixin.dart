import 'dart:async';

import 'package:flutter/foundation.dart';

import 'pass.dart';

mixin DebouncingMixin on ChangeNotifier {
  /// [DateTime] of the start of the last [_debounceTimer].
  DateTime? get lastChangeDateTime => _debounceTimerStartDateTime;

  /// [Duration] until [notifyListeners] is called.
  Duration? get untilNotify =>
      lastChangeDateTime?.pass(DateTime.now().difference);

  /// Duration of each [_debounceTimer].
  late final Duration duration;

  @protected
  void change(VoidCallback specificChangeMethod) {
    _debounceTimer?.cancel();
    _debounceTimerStartDateTime = DateTime.now();
    _debounceTimer = Timer(duration, () {
      _debounceTimerStartDateTime = null;
      specificChangeMethod.call();
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  /// Encapsulated [DateTime] of the start of the last [_debounceTimer].
  DateTime? _debounceTimerStartDateTime;

  /// The timer to notify about change.
  ///
  /// Created when [value] is changed.
  /// Triggered after some [_duration] if not replaced with new timer.
  Timer? _debounceTimer;
}
