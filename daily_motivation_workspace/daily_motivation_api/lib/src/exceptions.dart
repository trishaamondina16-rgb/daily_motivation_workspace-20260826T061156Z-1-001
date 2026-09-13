class DailyMotivationException implements Exception {
  final String message;
  final Object? cause;

  DailyMotivationException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'DailyMotivationException: $message '
          '(Underlying: $cause)';
    }

    return 'DailyMotivationException: $message';
  }
}