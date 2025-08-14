abstract class AuthRepository {
  Future<void> login(String username, String password);
  Future<void> logout(); // 로그아웃 메서드 추가
  Future<bool> isLoggedIn(); // 로그인 상태 확인 메서드 추가
}