abstract class Failure {
  final String error;

  const Failure(this.error);
}

class NoUserSignedInFailure extends Failure {
  const NoUserSignedInFailure() : super("No Users Signed in");
}

class UnknownFailure extends Failure {
  UnknownFailure(super.error);
}