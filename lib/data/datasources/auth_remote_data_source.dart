import 'package:dio/dio.dart';

import '../models/token_model.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<TokenModel> login(String username, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );
      return TokenModel.fromJson(response.data);
    } catch (e) {
      // Dio 에러 또는 서버 에러를 처리합니다.
      throw Exception('로그인에 실패했습니다.');
    }
  }
}