import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/auth_providers.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final loginState = ref.watch(loginViewModelProvider);
    final rememberMe = ref.watch(rememberMeNotifierProvider);

    useEffect(() {
      Future<void> loadInitialData() async {
        final shouldRemember = await ref.read(getRememberMeUseCaseProvider).call();
        if (shouldRemember) {
          final credentials = await ref.read(getCredentialsUseCaseProvider).call();
          usernameController.text = credentials['username'] ?? '';
          passwordController.text = credentials['password'] ?? '';
        }
      }
      loadInitialData();
      return null;
    }, const []);

    ref.listen(loginViewModelProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });

    void _launchURL() async {
      final url = Uri.parse('http://10.0.35.212/');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('링크를 열 수 없습니다: $url')));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/cologo.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Creating The Product Story",
                          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "THE WORLD’S BEST\nAPPLICATION DEVELOPMENT\nGROUP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            height: 1.2,
                            letterSpacing: 2,
                            shadows: [Shadow(blurRadius: 10.0, color: Colors.black54, offset: Offset(2.0, 2.0))],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "Please enter your details to sign in",
                          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: usernameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '아이디 입력',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            prefixIcon: const Icon(Icons.person_outline, color: Colors.white70),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '암호 입력',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            prefixIcon: const Icon(Icons.lock_outline, color: Colors.white70),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 0),
                        CheckboxListTile(
                          title: const Text('로그인 정보 기억하기', style: TextStyle(color: Colors.white70)),
                          value: rememberMe,
                          onChanged: (value) {
                            ref.read(rememberMeNotifierProvider.notifier).setRememberMe(value ?? false);
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: const Color(0xFF6A11CB),
                          checkColor: Colors.white,
                          contentPadding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: loginState.isLoading ? null : () {
                              ref.read(loginViewModelProvider.notifier).login(
                                usernameController.text,
                                passwordController.text,
                                rememberMe, // 체크박스 상태 전달
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6A11CB),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: loginState.isLoading
                                ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                                : const Text(
                              '로그인',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextButton(
                          onPressed: _launchURL,
                          child: Text(
                            '계정이 없으신가요? 가입하기',
                            style: TextStyle(color: Colors.white.withOpacity(0.8)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
