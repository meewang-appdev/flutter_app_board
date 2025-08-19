import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        onTap: () {
          // board 정보가 있을 때만 상세 페이지로 이동
          if (post.board != null) {
            context.push('/${post.board!.slug}/posts/${post.id}');
          }
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 공지사항 표시
              if (post.isNotice)
                Row(
                  children: [
                    Icon(Icons.campaign, size: 16, color: colorScheme.primary),
                    const SizedBox(width: 4),
                    Text(
                      '공지',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              if (post.isNotice) const SizedBox(height: 8),

              // 제목
              Text(
                post.title,
                style: textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // 작성자 및 카테고리
              Text(
                '[${post.category.name}] ${post.author.nickname}',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),

              // 조회수 및 좋아요 수
              Row(
                children: [
                  _buildIconText(
                    icon: Icons.visibility_outlined,
                    text: post.viewCount.toString(),
                    context: context,
                  ),
                  const SizedBox(width: 16),
                  _buildIconText(
                    icon: Icons.favorite_border,
                    text: post.likeCount.toString(),
                    context: context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 아이콘과 텍스트를 묶는 헬퍼 위젯
  Widget _buildIconText({
    required IconData icon,
    required String text,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 4),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}