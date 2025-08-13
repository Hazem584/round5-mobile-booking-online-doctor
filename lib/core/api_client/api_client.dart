import 'package:dio/dio.dart';

import '../token/token_provider.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient _i = ApiClient._();
  static ApiClient get I => _i;

  late final Dio dio;

  void init({required String baseUrl, required TokenProvider tokenProvider}) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Accept': 'application/json',
      },
    ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = await tokenProvider.getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            handler.next(options);
          },
        ),
      );
  }
}
