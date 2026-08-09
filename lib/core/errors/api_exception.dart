class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() {
    return 'ApiException(statusCode: $statusCode, message: $message)';
  }
}

class NetworkException extends ApiException {
  const NetworkException({
    super.message = 'Unable to connect to the server.',
  });
}

class TimeoutException extends ApiException {
  const TimeoutException({
    super.message = 'The request timed out.',
  });
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({
    super.message = 'Unauthorized request.',
  }) : super(statusCode: 401);
}

class ForbiddenException extends ApiException {
  const ForbiddenException({
    super.message = 'Access forbidden.',
  }) : super(statusCode: 403);
}

class NotFoundException extends ApiException {
  const NotFoundException({
    super.message = 'Resource not found.',
  }) : super(statusCode: 404);
}

class ServerException extends ApiException {
  const ServerException({
    super.message = 'Server error.',
    super.statusCode,
  });
}