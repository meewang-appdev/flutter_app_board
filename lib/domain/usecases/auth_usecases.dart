import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;
  LoginUseCase(this._repository);
  Future<void> call(String username, String password) => _repository.login(username, password);
}

class LogoutUseCase {
  final AuthRepository _repository;
  LogoutUseCase(this._repository);
  Future<void> call() => _repository.logout();
}

class GetAuthStatusUseCase {
  final AuthRepository _repository;
  GetAuthStatusUseCase(this._repository);
  Future<bool> call() => _repository.isLoggedIn();
}