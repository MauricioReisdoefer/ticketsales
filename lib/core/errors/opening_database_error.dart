class OpeningDatabaseError implements Exception {
  final String message;
  final dynamic cause;

  OpeningDatabaseError(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return "OpeningDatabaseError: $message (caused by: $cause)";
    }
    return "OpeningDatabaseError: $message";
  }
}
