// GoRouterクラスはRiverpodで依存注入
import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/repositories/auth_repository.dart';
import 'package:flutter_maestro_sample/views/error_screen.dart';
import 'package:flutter_maestro_sample/views/home_screen.dart';
import 'package:flutter_maestro_sample/views/sign_in_screen.dart';
import 'package:flutter_maestro_sample/views/sign_up_screen.dart';
import 'package:flutter_maestro_sample/views/top_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/top',
    routes: <GoRoute>[
      GoRoute(
        name: 'top',
        path: '/top',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const TopScreen(),
        ),
        routes: [
          // サブルートへの画面遷移のサンプル
          GoRoute(
            name: 'signin',
            path: 'signin',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const SigninScreen(),
            ),
          ),
          GoRoute(
            name: 'signup',
            path: 'signup',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const SignupScreen(),
            ),
          ),
          GoRoute(
            name: 'home',
            path: 'home',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const HomeScreen(),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(
        message: state.error!.message,
      ),
    ),
    redirect: (context, state) {
      final isSignedIn = ref.watch(authProvider).isSignedIn;
      if (isSignedIn) {
        return '/top/home';
      } else {
        return '/top/signin';
      }
    },
  ),
);
