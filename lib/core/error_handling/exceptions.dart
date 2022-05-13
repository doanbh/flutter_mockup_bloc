abstract class AppException implements Exception {
  final String? message;
  final String? from;

  AppException(this.message, this.from);
}

class UnhandledException extends AppException {
  UnhandledException([String? message, String? from])
      : super(message ?? 'Unkown', from);

  String toString() {
    return '''
UnhandledException: $message
              from: $from
''';
  }
}

class DataNotFoundException extends AppException {
  DataNotFoundException(String message, [String? from]) : super(message, from);

  String toString() {
    return '''
DataNotFoundException: $message not found
                 from: $from
''';
  }
}

class InternalServerException extends AppException {
  InternalServerException([String? message, String? from])
      : super(message, from);

  String toString() {
    return '''
InternalServerException: $message
                   from: $from
''';
  }
}

class NoConnectionException extends AppException {
  NoConnectionException([String? message, String? from]) : super(message, from);

  String toString() {
    return '''
NoConnectionException: $message
                 from: $from
''';
  }
}

class PoorConnectionException extends AppException {
  PoorConnectionException([String? message, String? from])
      : super(message, from);

  String toString() {
    return '''
PoorConnectionException: $message
                   from: $from
''';
  }
}

class DataParsingException extends AppException {
  DataParsingException(String message, [String? from]) : super(message, from);

  String toString() {
    return '''
DataParsingException: $message
                from: $from
''';
  }
}
