import 'package:flutter/widgets.dart';

import 'util/debouncing_mixin.dart';

/// A drop-in replacement for [SearchController] with debounce [Duration].
class DebouncingTextController extends ValueNotifier<TextEditingValue>
    with DebouncingMixin {
  /// Creates a [DebouncingTextController] with some debounce [duration].
  DebouncingTextController({
    String? text,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
         text == null ? TextEditingValue.empty : TextEditingValue(text: text),
       ) {
    this.duration = duration;
    _textEditingController = TextEditingController(text: text)
      ..addListener(_textEditingListener);
  }

  /// Original [TextEditingController] just in case.
  TextEditingController get textEditingController => _textEditingController;

  /// Simpler way to get text.
  String get text => value.text;

  @override
  void dispose() {
    _textEditingController.removeListener(_textEditingListener);
    _textEditingController.dispose();
    super.dispose();
  }

  /// Original [TextEditingController] under the hood.
  late final TextEditingController _textEditingController;

  void _textEditingListener() {
    final originalValue = _textEditingController.value;
    change(() => value = originalValue);
  }
}
