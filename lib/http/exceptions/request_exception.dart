class RequestException implements Exception {
  final String? message;

  RequestException(this.message);

  @override
  String toString() {
    return message ?? "Failed to load data. Pleasse try again later.";
  }
}
