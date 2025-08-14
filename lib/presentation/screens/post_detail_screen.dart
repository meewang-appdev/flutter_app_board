import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/board_providers.dart';

class PostDetailScreen extends ConsumerWidget {
  final int id;
  const PostDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDetailAsyncValue = ref.watch(postDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세'),
      ),
      body: postDetailAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('에러: $err')),
        data: (post) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('작성자: ${post.author.nickname}'),
                    const Spacer(),
                    Text('조회수: ${post.viewCount}'),
                  ],
                ),
                const Divider(),
                // [수정] onLinkTap 속성 추가
                Html(
                  data: post.content,
                  onLinkTap: (url, _, __) async {
                    if (url != null) {
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}