import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/board_providers.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchViewModelProvider);
    final recentSearches = ref.watch(recentSearchesNotifierProvider);
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '검색어를 입력하세요...',
            border: InputBorder.none,
          ),
          onSubmitted: (query) {
            ref.read(searchViewModelProvider.notifier).searchPosts(query);
          },
        ),
      ),
      body: searchState.when(
        // [수정] 초기 상태(data가 null)일 때 최근 검색어 목록을 보여줍니다.
        data: (posts) {
          // 검색어가 없고, 결과도 없을 때 (초기 화면)
          if (posts.isEmpty && searchController.text.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (recentSearches.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('최근 검색어', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: recentSearches.length,
                    itemBuilder: (context, index) {
                      final term = recentSearches[index];
                      return ListTile(
                        leading: const Icon(Icons.history),
                        title: Text(term),
                        onTap: () {
                          // 최근 검색어 클릭 시 검색 실행
                          searchController.text = term;
                          ref.read(searchViewModelProvider.notifier).searchPosts(term);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
          // 검색 결과가 없을 때
          if (posts.isEmpty) {
            return const Center(child: Text('검색 결과가 없습니다.'));
          }
          // 검색 결과가 있을 때
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text('[${post.board?.name ?? 'N/A'}] 작성자: ${post.author.nickname}'),
                onTap: () {
                  if (post.board != null) {
                    context.push('/${post.board!.slug}/posts/${post.id}');
                  }
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('에러: $err')),
      ),
    );
  }
}

