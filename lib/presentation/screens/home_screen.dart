import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/auth_providers.dart';
import '../providers/board_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardsAsyncValue = ref.watch(boardsProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // [수정] 하단 내비게이션 바 추가
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // 현재 '홈' 탭이 선택됨
        onTap: (index) {
          if (index == 1) {
            context.go('/search');
          } else if (index == 2) {
            ref.read(authNotifierProvider.notifier).logout();
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: '로그아웃'),
        ],
      ),
      // [수정] CustomScrollView와 Sliver를 사용하여 동적인 스크롤 화면 구현
      body: boardsAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('에러: $err')),
        data: (boards) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 120.0,
                backgroundColor: colorScheme.primary, // [수정] 배경색 추가
                foregroundColor: Colors.white, // [추가] 아이콘/뒤로가기 버튼 색상
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('게시판', style: textTheme.titleLarge),
                  centerTitle: false,
                ),
              ),
              // '업무보고일지' 링크를 위한 Sliver
              SliverToBoxAdapter(
                child: _ReportCard(),
              ),
              // 게시판 목록을 위한 Sliver
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final board = boards[index];
                    return _BoardCard(board: board);
                  },
                  childCount: boards.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// [추가] 업무보고일지 링크를 위한 커스텀 카드 위젯
class _ReportCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.assignment_ind_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text('업무보고일지', style: Theme.of(context).textTheme.titleMedium),
        subtitle: const Text('웹 페이지로 이동'),
        trailing: const Icon(Icons.open_in_new, size: 20),
        onTap: () async {
          final url = Uri.parse('https://docs.google.com/spreadsheets/d/1OpsMiIESCJVfl9Z9glOE5JJdD514sXXhPcz4bB9gzqw/edit?gid=876085385#gid=876085385');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
      ),
    );
  }
}

// [추가] 게시판 목록 항목을 위한 커스텀 카드 위젯
class _BoardCard extends StatelessWidget {
  final dynamic board;
  const _BoardCard({required this.board});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Icon(
            Icons.article_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Text(board.name, style: Theme.of(context).textTheme.titleMedium),
        subtitle: const Text('게시판 바로가기'),
        trailing: const Icon(Icons.chevron_right, size: 20),
        onTap: () {
          context.go('/${board.slug}/posts');
        },
      ),
    );
  }
}