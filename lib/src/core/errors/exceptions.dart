class NoUserSignedInException implements Exception {}

class  ExceptionWithMessage implements Exception {
  final String message;

  ExceptionWithMessage(this.message);
}