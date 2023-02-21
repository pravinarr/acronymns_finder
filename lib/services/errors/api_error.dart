import 'package:http/http.dart';

class ApiException implements Exception {
  int? statusCode;
  ApiException(Response response) {
    statusCode = response.statusCode;
  }
}
