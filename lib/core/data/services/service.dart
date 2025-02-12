import 'package:dio/dio.dart';
class Services {
  static const String _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  Services({required Dio dio}) : _dio = dio;
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      var response = await _dio.get('$_baseUrl$endPoint');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
