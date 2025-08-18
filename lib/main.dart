import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iriver_app_board/presentation/providers/auth_providers.dart';
import 'package:iriver_app_board/presentation/router/router.dart';
import 'package:iriver_app_board/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Flutter 앱이 실행되기 전에 네이티브 코드를 호출할 수 있도록 보장합니다.
  WidgetsFlutterBinding.ensureInitialized();

  // SharedPreferences 인스턴스를 비동기적으로 로드합니다.
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // sharedPreferencesProvider를 미리 로드한 prefs 인스턴스로 덮어씁니다.
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: '게시판 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}