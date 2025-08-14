import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_providers.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final loginState = ref.watch(loginViewModelProvider);

    // 로그인 상태가 변경될 때마다 알림을 표시하거나 화면을 이동하는 리스너
    ref.listen(loginViewModelProvider, (previous, next) {
      // 에러가 발생했을 때
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString())),
        );
      }
      // [수정] 성공했을 때 (로딩 상태에서 데이터 상태로 변경되었을 때)
      if (previous is AsyncLoading && !next.hasError) {
        // GoRouter가 상태 변화를 감지하고 자동으로 리다이렉트하지만,
        // 명시적으로 이동을 호출하여 즉각적인 반응을 보장할 수 있습니다.
        context.go('/');
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: '사용자 아이디'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            if (loginState.isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  ref.read(loginViewModelProvider.notifier).login(
                    usernameController.text,
                    passwordController.text,
                  );
                },
                child: const Text('로그인'),
              ),
          ],
        ),
      ),
    );
  }
}