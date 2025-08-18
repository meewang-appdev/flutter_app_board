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

// class GetAuthStatusUseCase {
//   final AuthRepository _repository;
//   GetAuthStatusUseCase(this._repository);
//   Future<bool> call() => _repository.isLoggedIn();
// }

class SaveCredentialsUseCase {
  final AuthRepository _repository;
  SaveCredentialsUseCase(this._repository);
  Future<void> call(String username, String password) => _repository.saveCredentials(username, password);
}

class GetCredentialsUseCase {
  final AuthRepository _repository;
  GetCredentialsUseCase(this._repository);
  Future<Map<String, String>> call() => _repository.getCredentials();
}

class ClearCredentialsUseCase {
  final AuthRepository _repository;
  ClearCredentialsUseCase(this._repository);
  Future<void> call() => _repository.clearCredentials();
}
class SaveRememberMeUseCase {
  final AuthRepository _repository;
  SaveRememberMeUseCase(this._repository);
  Future<void> call(bool value) => _repository.saveRememberMe(value);
}
class GetRememberMeUseCase {
  final AuthRepository _repository;
  GetRememberMeUseCase(this._repository);
  Future<bool> call() => _repository.getRememberMe();
}