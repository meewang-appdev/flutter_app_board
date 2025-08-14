import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/board_local_data_source.dart';
import '../../data/datasources/board_remote_data_source.dart';
import '../../data/domain/entities/post_detail.dart';
import '../../data/repositories/board_repository_impl.dart';
import '../../domain/entities/board.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/board_repository.dart';
import '../../domain/usecases/board_usecases.dart';
import 'auth_providers.dart';

final sharedPreferencesProvider = FutureProvider((ref) => SharedPreferences.getInstance());

final boardLocalDataSourceProvider = Provider<BoardLocalDataSource>(
      (ref) => BoardLocalDataSourceImpl(ref.watch(sharedPreferencesProvider).value!),
);

final boardRemoteDataSourceProvider = Provider<BoardRemoteDataSource>(
      (ref) => BoardRemoteDataSourceImpl(ref.watch(apiClientProvider).dio),
);

final boardRepositoryProvider = Provider<BoardRepository>(
      (ref) => BoardRepositoryImpl(
    remoteDataSource: ref.watch(boardRemoteDataSourceProvider),
    localDataSource: ref.watch(boardLocalDataSourceProvider), // 의존성 추가
  ),
);

// --- UseCase Provider들 ---
final getBoardsUseCaseProvider = Provider((ref) => GetBoardsUseCase(ref.watch(boardRepositoryProvider)));
final getPostsUseCaseProvider = Provider((ref) => GetPostsUseCase(ref.watch(boardRepositoryProvider)));
final getPostDetailUseCaseProvider = Provider((ref) => GetPostDetailUseCase(ref.watch(boardRepositoryProvider)));
final searchPostsUseCaseProvider = Provider((ref) => SearchPostsUseCase(ref.watch(boardRepositoryProvider))); // Provider 추가

// --- 데이터 제공 Provider들 ---
final boardsProvider = FutureProvider<List<Board>>((ref) => ref.watch(getBoardsUseCaseProvider).call());
final postsProvider = FutureProvider.family<List<Post>, String>((ref, slug) => ref.watch(getPostsUseCaseProvider).call(slug));
final postDetailProvider = FutureProvider.family<PostDetail, int>((ref, id) => ref.watch(getPostDetailUseCaseProvider).call(id));
final addRecentSearchUseCaseProvider = Provider((ref) => AddRecentSearchUseCase(ref.watch(boardRepositoryProvider)));
final getRecentSearchesUseCaseProvider = Provider((ref) => GetRecentSearchesUseCase(ref.watch(boardRepositoryProvider)));

final searchViewModelProvider = AsyncNotifierProvider.autoDispose<SearchViewModel, List<Post>>(SearchViewModel.new);

class SearchViewModel extends AutoDisposeAsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    return [];
  }

  Future<void> searchPosts(String query) async {
    if (query.isEmpty) {
      state = const AsyncData([]);
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(
          () => ref.read(searchPostsUseCaseProvider).call(query: query),
    );

    // 검색 성공 시 최근 검색어에 추가
    if (!state.hasError) {
      await ref.read(recentSearchesNotifierProvider.notifier).addSearch(query);
    }
  }
}

final recentSearchesNotifierProvider = NotifierProvider<RecentSearchesNotifier, List<String>>(RecentSearchesNotifier.new);

class RecentSearchesNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    // 초기 상태 로드
    _loadRecentSearches();
    return [];
  }

  Future<void> _loadRecentSearches() async {
    state = await ref.read(getRecentSearchesUseCaseProvider).call();
  }

  Future<void> addSearch(String term) async {
    await ref.read(addRecentSearchUseCaseProvider).call(term);
    // 상태를 다시 로드하여 UI를 업데이트
    await _loadRecentSearches();
  }
}