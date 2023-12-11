// GoRouterクラスはRiverpodで依存注入
import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/app_route_data.dart';
import 'package:flutter_maestro_sample/global/routes.dart';
import 'package:flutter_maestro_sample/models/product.dart';
import 'package:flutter_maestro_sample/views/detail_screen.dart';
import 'package:flutter_maestro_sample/views/error_screen.dart';
import 'package:flutter_maestro_sample/views/pages/cart_page.dart';
import 'package:flutter_maestro_sample/views/pages/home_page.dart';
import 'package:flutter_maestro_sample/views/pages/like_page.dart';
import 'package:flutter_maestro_sample/views/pages/profile_page.dart';
import 'package:flutter_maestro_sample/views/payment_screen.dart';
import 'package:flutter_maestro_sample/views/sign_in_screen.dart';
import 'package:flutter_maestro_sample/views/sign_up_screen.dart';
import 'package:flutter_maestro_sample/views/top_screen.dart';
import 'package:flutter_maestro_sample/widgets/app_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final likeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'like');
final cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');
final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.top,
    routes: $appRoutes,
    // routes: appRoutes,
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(
        message: state.error!.message,
      ),
    ),
    redirect: (context, state) {
      return null;
    },
  ),
);

final appRoutes = [
  StatefulShellRoute.indexedStack(
    parentNavigatorKey: rootNavigatorKey,
    builder: (context, state, navigationShell) {
      return AppNavigationBar(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(navigatorKey: homeNavigatorKey, routes: [
        GoRoute(
            name: 'home',
            path: '/home',
            pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const HomePage(),
                ),
            routes: [
              GoRoute(
                name: 'detail',
                path: 'detail',
                parentNavigatorKey: rootNavigatorKey,
                pageBuilder: (context, state) {
                  final product = state.extra as Product;
                  return MaterialPage(child: ProductDetailScreen(product: product));
                },
              )
            ]),
      ]),
      StatefulShellBranch(navigatorKey: likeNavigatorKey, routes: [
        GoRoute(
          name: 'like',
          path: '/like',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const LikePage(),
          ),
        ),
      ]),
      StatefulShellBranch(navigatorKey: cartNavigatorKey, routes: [
        GoRoute(
            name: 'cart',
            path: '/cart',
            pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const CartPage(),
                ),
            routes: [
              GoRoute(
                name: 'payment',
                path: Routes.payment,
                pageBuilder: (context, state) {
                  return MaterialPage(
                    key: state.pageKey,
                    child: const PaymentScreen(),
                  );
                },
              ),
            ]),
      ]),
      StatefulShellBranch(
        navigatorKey: profileNavigatorKey,
        routes: [
          GoRoute(
            name: 'profile',
            path: '/profile',
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfilePage(),
            ),
          ),
        ],
      ),
    ],
  ),
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
    ],
  ),
];
