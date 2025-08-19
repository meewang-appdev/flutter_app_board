import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_usecases.dart';
import 'core_providers.dart';

// --- 의존성 주입(DI) ---
final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>(
      (ref) => AuthLocalDataSourceImpl(ref.watch(sharedPreferencesProvider)),
);

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
      (ref) => AuthRemoteDataSourceImpl(ref.watch(apiClientProvider).dio),
);

final authRepositoryProvider = Provider<AuthRepository>(
      (ref) => AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
    secureStorage: ref.watch(secureStorageProvider),
  ),
);

// --- UseCase Provider들 ---
final loginUseCaseProvider = Provider((ref) => LoginUseCase(ref.watch(authRepositoryProvider)));
final logoutUseCaseProvider = Provider((ref) => LogoutUseCase(ref.watch(authRepositoryProvider)));
final saveCredentialsUseCaseProvider = Provider((ref) => SaveCredentialsUseCase(ref.watch(authRepositoryProvider)));
final getCredentialsUseCaseProvider = Provider((ref) => GetCredentialsUseCase(ref.watch(authRepositoryProvider)));
final clearCredentialsUseCaseProvider = Provider((ref) => ClearCredentialsUseCase(ref.watch(authRepositoryProvider)));
final saveRememberMeUseCaseProvider = Provider((ref) => SaveRememberMeUseCase(ref.watch(authRepositoryProvider)));
final getRememberMeUseCaseProvider = Provider((ref) => GetRememberMeUseCase(ref.watch(authRepositoryProvider)));

// --- 앱의 전반적인 인증 상태를 관리하는 Notifier ---
enum AuthState { authenticated, unauthenticated }

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState.unauthenticated;
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

// --- '로그인 정보 기억' 체크박스 상태 관리 Notifier ---
final rememberMeNotifierProvider = NotifierProvider<RememberMeNotifier, bool>(RememberMeNotifier.new);

class RememberMeNotifier extends Notifier<bool> {
  @override
  bool build() {
    ref.read(getRememberMeUseCaseProvider).call().then((value) {
      state = value;
    });
    return false;
  }

  void setRememberMe(bool value) {
    ref.read(saveRememberMeUseCaseProvider).call(value);
    state = value;
  }
}

// --- 로그인 ViewModel ---
final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<void>>((ref) {
  return LoginViewModel(
    ref.read(authNotifierProvider.notifier),
    ref.read(saveCredentialsUseCaseProvider),
    ref.read(clearCredentialsUseCaseProvider),
  );
});

class LoginViewModel extends StateNotifier<AsyncValue<void>> {
  final AuthNotifier _authNotifier;
  final SaveCredentialsUseCase _saveCredentialsUseCase;
  final ClearCredentialsUseCase _clearCredentialsUseCase;

  LoginViewModel(this._authNotifier, this._saveCredentialsUseCase, this._clearCredentialsUseCase) : super(const AsyncData(null));

  Future<void> login(String username, String password, bool rememberMe) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => _authNotifier.login(username, password));

    if (!result.hasError) {
      if (rememberMe) {
        await _saveCredentialsUseCase(username, password);
      } else {
        await _clearCredentialsUseCase();
      }
    }

    state = result;
  }
}