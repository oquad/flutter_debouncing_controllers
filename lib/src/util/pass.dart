/// Syntax sugar to pass nullable values.
///
/// Before:
/// ```dart
/// String? a;
///
/// late DateTime? b;
/// if (a == null) {
///   b = null;
/// } else {
///   b = DateTime.parse(a);
/// }
/// ```
///
/// After:
/// ```dart
/// String? a;
///
/// final b = a?.pass(DateTime.parse);
/// ```
extension Pass<T> on T {
  S pass<S>(S Function(T argument) function) => function(this);
}
