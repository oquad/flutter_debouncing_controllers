import 'package:flutter/material.dart';

import 'util/debouncing_mixin.dart';

/// A drop-in replacement for [SearchController] with debounce [Duration].
class DebouncingSearchController extends ValueNotifier<TextEditingValue>
    with DebouncingMixin {
  /// Original [SearchController].
  SearchController get searchController => _searchController;

  /// Simpler way to get text.
  String get text => value.text;

  /// Creates a [DebouncingSearchController] with some debounce [duration].
  DebouncingSearchController({
    Duration duration = const Duration(milliseconds: 300),
  }) : super(TextEditingValue.empty) {
    this.duration = duration;
    _searchController = SearchController()..addListener(_searchListener);
  }

  void _searchListener() {
    final originalValue = _searchController.value;
    change(() => value = originalValue);
  }

  @override
  void dispose() {
    _searchController.removeListener(_searchListener);
    _searchController.dispose();
    super.dispose();
  }

  /// Original [SearchController] under the hood.
  late final SearchController _searchController;
}
