enum AppError {
  // ignore: constant_identifier_names
  NotFound,
  // some errors codes
}

class ErrorMessage {
  final AppError key;
  final String message;

  const ErrorMessage({
    required this.key,
    required this.message,
  });
}
