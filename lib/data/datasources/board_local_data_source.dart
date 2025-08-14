import 'package:shared_preferences/shared_preferences.dart';

abstract class BoardLocalDataSource {
  Future<List<String>> getRecentSearches();
  Future<void> addRecentSearch(String term);
}

class BoardLocalDataSourceImpl implements BoardLocalDataSource {
  final SharedPreferences prefs;
  static const _key = 'recent_searches';

  BoardLocalDataSourceImpl(this.prefs);

  @override
  Future<void> addRecentSearch(String term) async {
    final terms = prefs.getStringList(_key) ?? [];
    // 중복된 검색어는 제거
    terms.remove(term);
    // 새로운 검색어를 맨 앞에 추가
    terms.insert(0, term);
    // 최대 5개까지만 저장
    if (terms.length > 5) {
      terms.removeLast();
    }
    await prefs.setStringList(_key, terms);
  }

  @override
  Future<List<String>> getRecentSearches() async {
    return prefs.getStringList(_key) ?? [];
  }
}