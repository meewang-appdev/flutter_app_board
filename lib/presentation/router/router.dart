import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_providers.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/post_detail_screen.dart';
import '../screens/post_list_screen.dart';
import '../screens/search_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ValueNotifier<int>(0);
  ref.onDispose(() => refreshNotifier.dispose());
  ref.listen(authNotifierProvider, (_, __) => refreshNotifier.value++);

  return GoRouter(
    refreshListenable: refreshNotifier,
    initialLocation: '/login',
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authNotifierProvider);
      final isLoggingIn = state.matchedLocation == '/login';

      // 로그인 상태인데 로그인 페이지로 가려고 하면 홈으로 리다이렉트
      if (authState == AuthState.authenticated && isLoggingIn) {
        return '/';
      }

      // 로그아웃 상태인데 로그인 페이지가 아닌 곳으로 가려고 하면 로그인 페이지로 리다이렉트
      if (authState == AuthState.unauthenticated && !isLoggingIn) {
        return '/login';
      }

      return null;
    },
    routes: <GoRoute>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'search',
            builder: (BuildContext context, GoRouterState state) => const SearchScreen(),
          ),
          GoRoute(
              path: ':slug/posts',
              builder: (BuildContext context, GoRouterState state) {
                final slug = state.pathParameters['slug']!;
                return PostListScreen(slug: slug);
              },
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (BuildContext context, GoRouterState state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return PostDetailScreen(id: id);
                  },
                ),
              ]
          ),
        ],
      ),
    ],
  );
});