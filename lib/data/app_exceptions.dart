class AppException implements Exception {
  final message;
  final _prefix;

  AppException([this.message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$message';
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message = "No Internet Connection!"])
      : super(message, 'NoInternetException');
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, 'Unauthorised Input');
}
