import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // GET request
  Future<dynamic> get({required String url}) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } on DioException catch (e) {
      throw Exception("GET error: ${e.response?.statusCode ?? e.message}");
    }
  }

  // POST request
  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.post(url, data: body);
      return response.data;
    } on DioException catch (e) {
      throw Exception("POST error: ${e.response?.statusCode ?? e.message}");
    }
  }
}



