import '../../data/domain/entities/post_detail.dart';
import '../entities/board.dart';
import '../entities/post.dart';
import '../repositories/board_repository.dart';

class GetBoardsUseCase {
  final BoardRepository _repository;
  GetBoardsUseCase(this._repository);
  Future<List<Board>> call() => _repository.getBoards();
}

class GetPostsUseCase {
  final BoardRepository _repository;
  GetPostsUseCase(this._repository);
  Future<List<Post>> call(String slug, {int page = 1}) => _repository.getPosts(slug, page);
}

class GetPostDetailUseCase {
  final BoardRepository _repository;
  GetPostDetailUseCase(this._repository);
  Future<PostDetail> call(int id) => _repository.getPostDetail(id);
}

class SearchPostsUseCase {
  final BoardRepository _repository;
  SearchPostsUseCase(this._repository);
  Future<List<Post>> call({
    required String query,
    String searchTarget = 'title_content',
    int page = 1,
  }) => _repository.searchPosts(query: query, searchTarget: searchTarget, page: page);
}

// [추가] AddRecentSearchUseCase 정의
class AddRecentSearchUseCase {
  final BoardRepository _repository;
  AddRecentSearchUseCase(this._repository);
  Future<void> call(String term) => _repository.addRecentSearch(term);
}

// [추가] GetRecentSearchesUseCase 정의
class GetRecentSearchesUseCase {
  final BoardRepository _repository;
  GetRecentSearchesUseCase(this._repository);
  Future<List<String>> call() => _repository.getRecentSearches();
}