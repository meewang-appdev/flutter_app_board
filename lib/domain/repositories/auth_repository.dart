abstract class AuthRepository {
  Future<void> login(String username, String password);
  Future<void> logout();
  // Future<bool> isLoggedIn();
  Future<void> saveCredentials(String username, String password);
  Future<Map<String, String>> getCredentials();
  Future<void> clearCredentials();
  Future<void> saveRememberMe(bool value);
  Future<bool> getRememberMe();
}