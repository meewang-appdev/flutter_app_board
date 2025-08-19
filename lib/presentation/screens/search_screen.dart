import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/board_providers.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/post_list_item.dart';
import '../widgets/shimmer_list_item.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchViewModelProvider);
    final scrollController = useScrollController();
    final searchController = useTextEditingController();

    useEffect(() {
      void listener() {
        if (scrollController.position.pixels >
            scrollController.position.maxScrollExtent - 300) {
          ref.read(searchViewModelProvider.notifier).fetchNextPage();
        }
      }
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: const InputDecoration(
              hintText: '검색어를 입력하세요...', border: InputBorder.none),
          onSubmitted: (query) =>
              ref.read(searchViewModelProvider.notifier).searchPosts(query),
        ),
      ),
      body: searchState.when(
        data: (posts) {
          final recentSearches = ref.watch(recentSearchesNotifierProvider);
          // 초기 상태 (검색 전)
          if (posts.isEmpty && searchController.text.isEmpty) {
            if (recentSearches.isEmpty) {
              return const EmptyStateWidget(
                  message: '최근 검색 기록이 없습니다.', icon: Icons.history);
            }
            // 최근 검색어 목록 UI
            return ListView.builder(
              itemCount: recentSearches.length,
              itemBuilder: (context, index) {
                final term = recentSearches[index];
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(term),
                  onTap: () {
                    searchController.text = term;
                    ref.read(searchViewModelProvider.notifier).searchPosts(term);
                  },
                );
              },
            );
          }
          // 검색 결과가 없을 때
          if (posts.isEmpty) {
            return const EmptyStateWidget(
                message: '검색 결과가 없습니다.', icon: Icons.search_off);
          }
          // 검색 결과가 있을 때
          return ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: posts.length,
            itemBuilder: (context, index) => PostListItem(post: posts[index]),
          );
        },
        error: (err, stack) => ErrorStateWidget(
          message: '검색에 실패했습니다.',
          onRetry: () => ref.invalidate(searchViewModelProvider),
        ),
        loading: () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: 8,
          itemBuilder: (context, index) => const ShimmerListItem(),
        ),
      ),
      bottomNavigationBar: searchState.isLoading && searchState.hasValue
          ? const LinearProgressIndicator()
          : null,
    );
  }
}