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

  ref.listen(authNotifierProvider, (_, __) {
    refreshNotifier.value++;
  });

  return GoRouter(
    refreshListenable: refreshNotifier,
    initialLocation: '/login',
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final isLoggingIn = state.matchedLocation == '/login';

      if (authState == AuthState.authenticated && isLoggingIn) return '/';
      if (authState == AuthState.unauthenticated && !isLoggingIn) return '/login';
      return null;
    },
    routes: <GoRoute>[
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final authState = ref.read(authNotifierProvider);
          return authState == AuthState.authenticated ? null : '/login';
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
        routes: [
          GoRoute(
            path: 'search',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SearchScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
              path: ':slug/posts',
              pageBuilder: (context, state) {
                final slug = state.pathParameters['slug']!;
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: PostListScreen(slug: slug),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
                );
              },
              routes: [
                GoRoute(
                  path: ':id',
                  pageBuilder: (context, state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return CustomTransitionPage(
                      key: state.pageKey,
                      child: PostDetailScreen(id: id),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    );
                  },
                ),
              ]
          ),
        ],
      ),
    ],
  );
});