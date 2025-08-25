import '../../domain/entities/author.dart';
import '../../domain/entities/board.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/board_repository.dart';
import '../datasources/board_local_data_source.dart';
import '../datasources/board_remote_data_source.dart';
import '../domain/entities/post_detail.dart';

class BoardRepositoryImpl implements BoardRepository {
  final BoardRemoteDataSource remoteDataSource;
  final BoardLocalDataSource localDataSource;

  BoardRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource, // 생성자에 추가
  });

  @override
  Future<List<Board>> getBoards() async {
    final boardModels = await remoteDataSource.getBoards();
    return boardModels
        .map((model) => Board(
      id: model.id,
      name: model.name,
      slug: model.slug,
      loginRequired: model.loginRequired,
      adminOnly: model.adminOnly,
    )).toList();
  }

  @override
  Future<List<Post>> getPosts(String slug, int page) async {
    final postModels = await remoteDataSource.getPosts(slug, page);
    return _mapPostListItemModelsToPosts(postModels);
  }

  @override
  Future<PostDetail> getPostDetail(int id) async {
    final model = await remoteDataSource.getPostDetail(id);
    return PostDetail(
      id: model.id,
      title: model.title,
      content: model.content,
      author: Author(id: model.author.id, nickname: model.author.nickname),
      board: Board(
          id: model.board.id,
          name: model.board.name,
          slug: model.board.slug,
          loginRequired: model.board.loginRequired,
          adminOnly: model.board.adminOnly),
      category: Category(name: model.category.name),
      createdAt: model.createdAt,
      viewCount: model.viewCount,
      likeCount: model.likeCount,
    );
  }

  @override
  Future<List<Post>> searchPosts({required String query, String searchTarget = 'title_content', int page = 1}) async {
    final postModels = await remoteDataSource.searchPosts(query, searchTarget, page);
    return _mapPostListItemModelsToPosts(postModels);
  }

  // 중복 코드를 줄이기 위한 private 헬퍼 메서드
  List<Post> _mapPostListItemModelsToPosts(List<dynamic> models) {
    return models.map((model) => Post(
      id: model.id,
      title: model.title,
      author: Author(id: model.author.id, nickname: model.author.nickname),
      board: model.board != null
          ? Board(
          id: model.board.id,
          name: model.board.name,
          slug: model.board.slug,
          // [수정] model.board에서 속성을 가져오도록 수정
          loginRequired: model.board.loginRequired,
          adminOnly: model.board.adminOnly)
          : null,
      category: Category(name: model.category.name),
      isNotice: model.isNotice,
      createdAt: model.createdAt,
      viewCount: model.viewCount,
      likeCount: model.likeCount,
    )).toList();
  }

  @override
  Future<void> addRecentSearch(String term) {
    return localDataSource.addRecentSearch(term);
  }

  @override
  Future<List<String>> getRecentSearches() {
    return localDataSource.getRecentSearches();
  }
}