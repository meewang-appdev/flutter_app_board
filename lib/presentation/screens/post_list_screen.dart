import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/board_providers.dart';

class PostListScreen extends ConsumerWidget {
  final String slug;
  const PostListScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider(slug));

    return Scaffold(
      appBar: AppBar(title: Text('게시글 목록 ($slug)')),
      body: postsAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('에러: $err')),
        data: (posts) {
          if (posts.isEmpty) {
            return const Center(child: Text('게시글이 없습니다.'));
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                // [수정] 공지사항일 경우 아이콘과 특별한 스타일을 적용합니다.
                leading: post.isNotice ? const Icon(Icons.campaign, color: Colors.blueAccent) : null,
                title: Text(
                  post.title,
                  style: TextStyle(
                    fontWeight: post.isNotice ? FontWeight.bold : FontWeight.normal,
                    color: post.isNotice ? Colors.blueAccent : null,
                  ),
                ),
                subtitle: Text('작성자: ${post.author.nickname}'),
                onTap: () {
                  context.go('/$slug/posts/${post.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
