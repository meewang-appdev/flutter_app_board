import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iriver_app_board/presentation/providers/core_providers.dart';
import 'package:iriver_app_board/presentation/router/router.dart';
import 'package:iriver_app_board/presentation/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  debugPrint("--- [main.dart] main() A: 시작 ---");
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("--- [main.dart] main() B: WidgetsBinding 초기화 완료 ---");

  final prefs = await SharedPreferences.getInstance();
  debugPrint("--- [main.dart] main() C: SharedPreferences 로딩 완료 ---");

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
  debugPrint("--- [main.dart] main() D: runApp() 호출 완료 ---");
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("--- [main.dart] MyApp build() 시작 ---");
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: '게시판 앱',
      theme: AppTheme.getTheme(),
      routerConfig: router,
    );
  }
}