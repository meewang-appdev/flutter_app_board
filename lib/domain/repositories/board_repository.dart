import '../../data/domain/entities/post_detail.dart';
import '../entities/board.dart';
import '../entities/post.dart';

abstract class BoardRepository {
  Future<List<Board>> getBoards();
  Future<List<Post>> getPosts(String slug, int page);
  Future<PostDetail> getPostDetail(int id); // 메서드 추가
  Future<List<Post>> searchPosts({
    required String query,
    String searchTarget = 'title_content',
    int page = 1,
  });
  Future<List<String>> getRecentSearches();
  Future<void> addRecentSearch(String term);
}