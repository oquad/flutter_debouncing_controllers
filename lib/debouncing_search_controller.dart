import 'dart:async';

import 'package:flutter/material.dart';

/// A drop-in replacement for [SearchController] with debounce [Duration].
class DebouncingSearchController extends TextEditingController {
  /// Original [SearchController] just in case.
  SearchController get searchController => _searchController;

  /// The timer to notify about [TextEditingValue] change.
  ///
  /// Created when [_searchController]'s value changes.
  /// Triggered after some [_duration] if not replaced with new timer.
  Timer? _debounceTimer;

  /// Duration of each [_debounceTimer].
  final Duration _duration;

  /// Original [SearchController] under the hood.
  final SearchController _searchController;

  /// Creates a [DebouncingSearchController] with some debounce [duration].
  DebouncingSearchController({
    Duration duration = const Duration(milliseconds: 300),
  }) : _searchController = SearchController(),
       _debounceTimer = null,
       _duration = duration {
    _searchController.addListener(_searchListener);
  }

  void _searchListener() {
    final originalValue = _searchController.value;
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_duration, () => value = originalValue);
  }

  @override
  void dispose() {
    _searchController.removeListener(_searchListener);
    _searchController.dispose();
    super.dispose();
  }
}
