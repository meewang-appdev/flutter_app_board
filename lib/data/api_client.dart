import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/providers/auth_providers.dart';

class ApiClient {
  final Ref ref;
  late final Dio dio;

  ApiClient(this.ref) {
    dio = Dio();
    dio.options.baseUrl = 'http://10.0.35.212:8080/api/v1';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final storage = ref.read(secureStorageProvider);
          final token = await storage.read(key: 'access_token');

          // [디버깅] 토큰 존재 여부와 헤더 추가 과정을 로그로 확인합니다.
          if (token != null) {
            debugPrint('[ApiClient] 토큰 발견! 헤더에 추가합니다.');
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            debugPrint('[ApiClient] 토큰이 없습니다. 헤더를 추가하지 않습니다.');
          }
          debugPrint('[ApiClient] 요청 URL: ${options.uri}');
          debugPrint('[ApiClient] 요청 헤더: ${options.headers}');

          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            await ref.read(authNotifierProvider.notifier).logout();
          }
          return handler.next(e);
        },
      ),
    );
  }
}