import 'package:flutter/widgets.dart';

import 'util/debouncing_mixin.dart';

/// A debouncing value notifier.
class DebouncingValueNotifier<T> extends ValueNotifier<T> with DebouncingMixin {
  /// Creates a [DebouncingValueNotifier] with some debounce [duration].
  DebouncingValueNotifier(
    super.value, {
    Duration duration = const Duration(milliseconds: 300),
  }) : _immediateValue = value {
    this.duration = duration;
  }

  @override
  set value(T newValue) {
    _immediateValue = newValue;
    change(() => super.value = newValue);
  }

  /// The last [value] given.
  T get immediateValue => _immediateValue;

  T _immediateValue;
}
