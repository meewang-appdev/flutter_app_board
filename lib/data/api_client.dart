import 'package:dio/dio.dart';
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
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          // 401 Unauthorized 에러(토큰 만료 등) 발생 시 자동 로그아웃 처리
          if (e.response?.statusCode == 401) {
            await ref.read(authNotifierProvider.notifier).logout();
          }
          return handler.next(e);
        },
      ),
    );
  }
}
