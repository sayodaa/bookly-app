import 'package:dio/dio.dart';

class Services {
  static const String _baseUrl = "https://api.itbook.store/1.0/";
  final Dio _dio;

  Services({required Dio dio}) : _dio = dio;
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      var response = await _dio.get('$_baseUrl$endPoint');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load books');
    }
}
}
