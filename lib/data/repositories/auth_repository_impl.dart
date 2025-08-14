import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({required this.remoteDataSource, required this.secureStorage});

  @override
  Future<void> login(String username, String password) async {
    final tokenModel = await remoteDataSource.login(username, password);
    await secureStorage.write(key: 'access_token', value: tokenModel.accessToken);
  }

  @override
  Future<void> logout() async {
    // 저장된 토큰을 삭제하여 로그아웃 처리
    await secureStorage.delete(key: 'access_token');
  }

  @override
  Future<bool> isLoggedIn() async {
    // 토큰 존재 여부로 로그인 상태를 확인
    final token = await secureStorage.read(key: 'access_token');
    return token != null;
  }
}