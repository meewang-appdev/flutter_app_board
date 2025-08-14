import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iriver_app_board/presentation/router/router.dart';
import 'package:iriver_app_board/presentation/screens/login_screen.dart';

void main() {
  // Riverpod를 앱 전체에서 사용하기 위해 ProviderScope로 감싸줍니다.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // routerProvider를 통해 GoRouter 인스턴스를 가져옵니다.
    final router = ref.watch(routerProvider);

    // MaterialApp.router를 사용하여 GoRouter와 앱을 연결합니다.
    return MaterialApp.router(
      title: '게시판 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // routerConfig에 router 인스턴스를 전달합니다.
      routerConfig: router,
    );
  }
}