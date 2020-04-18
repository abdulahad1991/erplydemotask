class GenericExceptions implements Exception {
  final _message;
  final _prefix;

  GenericExceptions([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends GenericExceptions {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends GenericExceptions {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends GenericExceptions {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends GenericExceptions {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}