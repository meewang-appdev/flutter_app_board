import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_providers.dart';
import '../providers/board_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 이 화면은 인증된 사용자만 볼 수 있으므로, 바로 게시판 데이터를 요청합니다.
    final boardsAsyncValue = ref.watch(boardsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시판 목록'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.go('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authNotifierProvider.notifier).logout(),
          ),
        ],
      ),
      body: boardsAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('에러: $err')),
        data: (boards) {
          return ListView.builder(
            itemCount: boards.length,
            itemBuilder: (context, index) {
              final board = boards[index];
              return ListTile(
                title: Text(board.name),
                onTap: () {
                  context.go('/${board.slug}/posts');
                },
              );
            },
          );
        },
      ),
    );
  }
}

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 앱의 전반적인 인증 상태를 감시합니다.
//     final authState = ref.watch(authNotifierProvider);
//     final boardsAsyncValue = ref.watch(boardsProvider);
//
//     // 1. 인증 상태를 아직 모를 경우 (앱 첫 실행 시)
//     if (authState == AuthState.unknown) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     // 2. 로그아웃 상태일 경우 (로그인 유도 화면)
//     if (authState == AuthState.unauthenticated) {
//       return Scaffold(
//         // [수정] 배경 이미지를 삭제하고 어두운 배경색을 지정합니다.
//         backgroundColor: const Color(0xFF1a1a1a),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.5), // 어두운 반투명 배경
//                   borderRadius: BorderRadius.circular(8), // 둥근 모서리
//                 ),
//                 child: const Text(
//                   '서비스를 이용하려면\n로그인이 필요합니다.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () => context.go('/login'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF6A11CB),
//                   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                 ),
//                 child: const Text(
//                   '로그인 화면으로 이동',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     // 3. 로그인 상태일 경우 (게시판 목록)
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('게시판 목록'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () => context.go('/search'),
//           ),
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () => ref.read(authNotifierProvider.notifier).logout(),
//           ),
//         ],
//       ),
//       body: boardsAsyncValue.when(
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (err, stack) => Center(child: Text('에러: $err')),
//         data: (boards) {
//           return ListView.builder(
//             itemCount: boards.length,
//             itemBuilder: (context, index) {
//               final board = boards[index];
//               return ListTile(
//                 title: Text(board.name),
//                 onTap: () {
//                   context.go('/${board.slug}/posts');
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
