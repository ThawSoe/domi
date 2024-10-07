base class MException {
  final String errorMessage;
  final String? errorCode;
  const MException({required this.errorMessage, this.errorCode});
}

final class SomeError extends MException {
  SomeError(
      {super.errorMessage = "Unknown error. Please contact the develop."});
}
