import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<Map<String, String>> getCredentials();
  Future<void> saveCredentials(String username, String password);
  Future<void> clearCredentials(); // 자격 증명 삭제 메서드 추가
  Future<bool> getRememberMe();
  Future<void> saveRememberMe(bool value);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;
  static const _userKey = 'saved_username';
  static const _passKey = 'saved_password';
  static const _rememberKey = 'remember_me';

  AuthLocalDataSourceImpl(this.prefs);

  @override
  Future<Map<String, String>> getCredentials() async {
    final username = prefs.getString(_userKey) ?? '';
    final password = prefs.getString(_passKey) ?? '';
    return {'username': username, 'password': password};
  }

  @override
  Future<void> saveCredentials(String username, String password) async {
    await prefs.setString(_userKey, username);
    await prefs.setString(_passKey, password);
  }

  @override
  Future<void> clearCredentials() async {
    await prefs.remove(_userKey);
    await prefs.remove(_passKey);
  }

  @override
  Future<bool> getRememberMe() async {
    return prefs.getBool(_rememberKey) ?? false;
  }

  @override
  Future<void> saveRememberMe(bool value) async {
    await prefs.setBool(_rememberKey, value);
  }
}