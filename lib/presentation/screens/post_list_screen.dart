import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/board_providers.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/post_list_item.dart';
import '../widgets/shimmer_list_item.dart';

class PostListScreen extends HookConsumerWidget {
  final String slug;
  const PostListScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postListViewModelProvider(slug));
    final scrollController = useScrollController();

    useEffect(() {
      void listener() {
        if (scrollController.position.pixels > scrollController.position.maxScrollExtent - 300) {
          ref.read(postListViewModelProvider(slug).notifier).fetchNextPage();
        }
      }
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(title: Text('게시글 목록 ($slug)')),
      body: postsAsyncValue.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyStateWidget(message: '게시글이 없습니다.', icon: Icons.article_outlined);
          }
          return ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: posts.length,
            itemBuilder: (context, index) => PostListItem(post: posts[index]),
          );
        },
        error: (err, stack) => ErrorStateWidget(
          message: '게시글을 불러오는데 실패했습니다.',
          onRetry: () => ref.invalidate(postListViewModelProvider(slug)),
        ),
        loading: () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: 8,
          itemBuilder: (context, index) => const ShimmerListItem(),
        ),
      ),
      // [추가] 다음 페이지 로딩 인디케이터
      bottomNavigationBar: postsAsyncValue.isLoading && postsAsyncValue.hasValue
          ? const LinearProgressIndicator()
          : null,
    );
  }
}