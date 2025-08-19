import 'package:flutter/cupertino.dart';
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
import 'core_providers.dart';

// --- 의존성 주입(DI) ---
final boardLocalDataSourceProvider = Provider<BoardLocalDataSource>(
      (ref) => BoardLocalDataSourceImpl(ref.watch(sharedPreferencesProvider)),
);

final boardRemoteDataSourceProvider = Provider<BoardRemoteDataSource>(
      (ref) => BoardRemoteDataSourceImpl(ref.watch(apiClientProvider).dio),
);

final boardRepositoryProvider = Provider<BoardRepository>(
      (ref) => BoardRepositoryImpl(
    remoteDataSource: ref.watch(boardRemoteDataSourceProvider),
    localDataSource: ref.watch(boardLocalDataSourceProvider),
  ),
);

// --- UseCase Provider들 ---
final getBoardsUseCaseProvider = Provider((ref) => GetBoardsUseCase(ref.watch(boardRepositoryProvider)));
final getPostsUseCaseProvider = Provider((ref) => GetPostsUseCase(ref.watch(boardRepositoryProvider)));
final getPostDetailUseCaseProvider = Provider((ref) => GetPostDetailUseCase(ref.watch(boardRepositoryProvider)));
final searchPostsUseCaseProvider = Provider((ref) => SearchPostsUseCase(ref.watch(boardRepositoryProvider)));
final addRecentSearchUseCaseProvider = Provider((ref) => AddRecentSearchUseCase(ref.watch(boardRepositoryProvider)));
final getRecentSearchesUseCaseProvider = Provider((ref) => GetRecentSearchesUseCase(ref.watch(boardRepositoryProvider)));

// --- 데이터 제공 Provider들 ---
final boardsProvider = FutureProvider<List<Board>>((ref) => ref.watch(getBoardsUseCaseProvider).call());
final postDetailProvider = FutureProvider.family<PostDetail, int>((ref, id) => ref.watch(getPostDetailUseCaseProvider).call(id));

// --- ViewModel Provider들 ---
final postListViewModelProvider = AsyncNotifierProvider.family<PostListViewModel, List<Post>, String>(PostListViewModel.new);

class PostListViewModel extends FamilyAsyncNotifier<List<Post>, String> {
  late GetPostsUseCase _getPostsUseCase;
  int _page = 1;
  bool _hasMore = true;

  @override
  Future<List<Post>> build(String arg) async {
    _getPostsUseCase = ref.read(getPostsUseCaseProvider);
    _page = 1;
    _hasMore = true;
    final posts = await _getPostsUseCase.call(arg, page: _page);
    return posts;
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading || !_hasMore) return;

    final _tag = 'SearchViewModel';
    debugPrint('[$_tag] fetchNextPage START.');
    final oldState = state;

    state = const AsyncValue<List<Post>>.loading().copyWithPrevious(state);
    debugPrint('[$_tag]   - State after copyWithPrevious: $state');

    _page++;
    try {
      final newPosts = await _getPostsUseCase.call(arg, page: _page);
      if (newPosts.isEmpty) _hasMore = false;

      // state = AsyncData([...state.value ?? [], ...newPosts]);
      final combinedPosts = <Post>[...oldState.value ?? [], ...newPosts];
      state = AsyncData(combinedPosts);
      debugPrint('[$_tag] fetchNextPage SUCCESS. Total items: ${combinedPosts.length}');
    } catch (e, s) {
      debugPrint('[$_tag] fetchNextPage ERROR: $e');
      state = AsyncError<List<Post>>(e, s).copyWithPrevious(state);
    }
  }
}

final searchViewModelProvider = AsyncNotifierProvider.autoDispose<SearchViewModel, List<Post>>(SearchViewModel.new);

class SearchViewModel extends AutoDisposeAsyncNotifier<List<Post>> {
  int _page = 1;
  bool _hasMore = true;
  String _currentQuery = '';

  @override
  Future<List<Post>> build() async {
    return [];
  }

  Future<void> searchPosts(String query) async {
    if (query.isEmpty) {
      state = const AsyncData([]);
      return;
    }
    _page = 1;
    _hasMore = true;
    _currentQuery = query;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
          () => ref.read(searchPostsUseCaseProvider).call(query: query, page: _page),
    );
    if (!state.hasError) {
      await ref.read(recentSearchesNotifierProvider.notifier).addSearch(query);
    }
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading || !_hasMore || _currentQuery.isEmpty) return;
    state = const AsyncValue<List<Post>>.loading().copyWithPrevious(state);
    _page++;
    try {
      final newPosts = await ref.read(searchPostsUseCaseProvider).call(query: _currentQuery, page: _page);
      if (newPosts.isEmpty) _hasMore = false;
      state = AsyncData([...state.value ?? [], ...newPosts]);
    } catch (e, s) {
      state = AsyncError<List<Post>>(e, s).copyWithPrevious(state);
    }
  }
}

final recentSearchesNotifierProvider = NotifierProvider<RecentSearchesNotifier, List<String>>(RecentSearchesNotifier.new);

class RecentSearchesNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    _loadRecentSearches();
    return [];
  }

  Future<void> _loadRecentSearches() async {
    state = await ref.read(getRecentSearchesUseCaseProvider).call();
  }

  Future<void> addSearch(String term) async {
    await ref.read(addRecentSearchUseCaseProvider).call(term);
    await _loadRecentSearches();
  }
}
