class AppException implements Exception {
  late final _prefix;
  late final _message;

  AppException([this._message, this._prefix]);
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, ' No internet');
}
class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, ' OOPS ! Time Out');
}
class ServerEror extends AppException {
  ServerEror([String? message]) : super(message, ' Internal server Error !');
}
class InvalidData extends AppException {
  InvalidData([String? message]) : super(message, ' Invalid Data ');
}
class Emptytext extends AppException {
  Emptytext([String? message]) : super(message, 'Please Enter text');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url ');
}

class FetchdataException extends AppException {
  FetchdataException([String? message]) : super(message, 'Not able to fetch data');
}