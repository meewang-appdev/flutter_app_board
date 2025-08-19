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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세'),
      ),
      body: postDetailAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('에러: $err')),
        data: (post) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 카테고리 및 게시판 정보
                      Text(
                        '[${post.board.name}] ${post.category.name}',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // 제목
                      Text(post.title, style: textTheme.headlineSmall),
                      const SizedBox(height: 16),
                      // 작성자 및 작성일
                      Row(
                        children: [
                          // TODO: 작성자 프로필 이미지 추가
                          const CircleAvatar(radius: 20, child: Icon(Icons.person)),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.author.nickname, style: textTheme.titleSmall),
                              Text(
                                '${post.createdAt.toLocal()} • 조회 ${post.viewCount}',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(height: 32),
                      // 본문 내용 (HTML)
                      Html(
                        data: post.content,
                        style: {
                          "body": Style(
                            fontSize: FontSize(16),
                            lineHeight: const LineHeight(1.6),
                          ),
                          "a": Style(color: Theme.of(context).colorScheme.primary),
                        },
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
                ),
              ),
              // 하단 인터랙션 버튼 영역
              _buildInteractionBar(post, context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInteractionBar(dynamic post, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            onPressed: () { /* TODO: 좋아요 기능 구현 */ },
            icon: const Icon(Icons.favorite_border),
            label: Text('좋아요 ${post.likeCount}'),
          ),
          const VerticalDivider(width: 20, thickness: 1),
          TextButton.icon(
            onPressed: () { /* TODO: 댓글 기능 구현 */ },
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('댓글'),
          ),
        ],
      ),
    );
  }
}
