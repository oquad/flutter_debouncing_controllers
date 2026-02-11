import 'dart:async';

import 'package:flutter/widgets.dart';

/// A drop-in replacement for [SearchController] with debounce [Duration].
class DebouncingTextController extends ValueNotifier<TextEditingValue> {
  /// Original [TextEditingController] just in case.
  TextEditingController get textEditingController => _textEditingController;

  /// The timer to notify about [TextEditingValue] change.
  ///
  /// Created when [_searchController]'s value changes.
  /// Triggered after some [_duration] if not replaced with new timer.
  Timer? _debounceTimer;

  /// Duration of each [_debounceTimer].
  final Duration _duration;

  /// Original [TextEditingController] under the hood.
  final TextEditingController _textEditingController;

  /// Creates a [DebouncingTextController] with some debounce [duration].
  DebouncingTextController({
    String? text,
    Duration duration = const Duration(milliseconds: 300),
  }) : _textEditingController = TextEditingController(text: text),
       _debounceTimer = null,
       _duration = duration,
       super(
         text == null ? TextEditingValue.empty : TextEditingValue(text: text),
       ) {
    _textEditingController.addListener(_textEditingListener);
  }

  void _textEditingListener() {
    final originalValue = _textEditingController.value;
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_duration, () => value = originalValue);
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_textEditingListener);
    _textEditingController.dispose();
    super.dispose();
  }
}
