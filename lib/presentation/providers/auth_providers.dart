import 'package:dio/dio.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/api_client.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_usecases.dart';

// --- 의존성 주입(DI)을 위한 Provider들 ---
final dioProvider = Provider((ref) => Dio());
final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

// ApiClient가 AuthNotifier를 통해 로그아웃을 트리거할 수 있도록 Ref를 전달합니다.
final apiClientProvider = Provider((ref) => ApiClient(ref));

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
      (ref) => AuthRemoteDataSourceImpl(ref.watch(apiClientProvider).dio),
);

final authRepositoryProvider = Provider<AuthRepository>(
      (ref) => AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    secureStorage: ref.watch(secureStorageProvider),
  ),
);

// --- UseCase Provider들 ---
final loginUseCaseProvider = Provider((ref) => LoginUseCase(ref.watch(authRepositoryProvider)));
final logoutUseCaseProvider = Provider((ref) => LogoutUseCase(ref.watch(authRepositoryProvider)));
final getAuthStatusUseCaseProvider = Provider((ref) => GetAuthStatusUseCase(ref.watch(authRepositoryProvider)));

// --- 앱의 전반적인 인증 상태를 관리하는 Notifier ---
enum AuthState { unknown, authenticated, unauthenticated }

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // 초기 상태는 '알 수 없음'
    // 앱 시작 시 자동 로그인을 시도합니다.
    _checkAuthStatus();
    return AuthState.unknown;
  }

  Future<void> _checkAuthStatus() async {
    final isLoggedIn = await ref.read(getAuthStatusUseCaseProvider).call();
    state = isLoggedIn ? AuthState.authenticated : AuthState.unauthenticated;
  }

  Future<void> login(String username, String password) async {
    await ref.read(loginUseCaseProvider).call(username, password);
    state = AuthState.authenticated;
  }

  Future<void> logout() async {
    await ref.read(logoutUseCaseProvider).call();
    state = AuthState.unauthenticated;
  }
}

// --- 로그인 화면의 상태를 관리할 ViewModel ---
final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<void>>((ref) {
  return LoginViewModel(ref.read(authNotifierProvider.notifier));
});

class LoginViewModel extends StateNotifier<AsyncValue<void>> {
  final AuthNotifier _authNotifier;
  LoginViewModel(this._authNotifier) : super(const AsyncData(null));

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _authNotifier.login(username, password));
  }
}