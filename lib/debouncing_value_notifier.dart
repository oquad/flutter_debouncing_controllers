import 'dart:async';

import 'package:flutter/widgets.dart';

/// A debouncing value notifier.
class DebouncingValueNotifier<T> extends ValueNotifier<T> {
  /// The timer to notify about change.
  ///
  /// Created when [value] is changed.
  /// Triggered after some [_duration] if not replaced with new timer.
  Timer? _debounceTimer;

  /// Duration of each [_debounceTimer].
  final Duration _duration;

  /// Creates a [DebouncingValueNotifier] with some debounce [duration].
  DebouncingValueNotifier(
    super._value, {
    Duration duration = const Duration(milliseconds: 300),
  }) : _debounceTimer = null,
       _duration = duration;

  @override
  set value(T newValue) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_duration, () => super.value = newValue);
  }
}
