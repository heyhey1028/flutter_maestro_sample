// GoRouterクラスはRiverpodで依存注入
import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/routes.dart';
import 'package:flutter_maestro_sample/models/product.dart';
import 'package:flutter_maestro_sample/repositories/auth_repository.dart';
import 'package:flutter_maestro_sample/views/detail_screen.dart';
import 'package:flutter_maestro_sample/views/error_screen.dart';
import 'package:flutter_maestro_sample/views/pages/cart_page.dart';
import 'package:flutter_maestro_sample/views/pages/home_page.dart';
import 'package:flutter_maestro_sample/views/pages/like_page.dart';
import 'package:flutter_maestro_sample/views/pages/profile_page.dart';
import 'package:flutter_maestro_sample/views/sign_in_screen.dart';
import 'package:flutter_maestro_sample/views/sign_up_screen.dart';
import 'package:flutter_maestro_sample/views/top_screen.dart';
import 'package:flutter_maestro_sample/widgets/app_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _likeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'like');
final _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.top,
    routes: $appRoutes,
    // routes: [
    // StatefulShellRoute.indexedStack(
    //     parentNavigatorKey: _rootNavigatorKey,
    //     builder: (context, state, navigationShell) {
    //       return AppNavigationBar(navigationShell: navigationShell);
    //     },
    //     branches: [
    //       StatefulShellBranch(navigatorKey: _homeNavigatorKey, routes: [
    //         GoRoute(
    //             name: 'home',
    //             path: '/home',
    //             pageBuilder: (context, state) => NoTransitionPage(
    //                   key: state.pageKey,
    //                   child: const HomePage(),
    //                 ),
    //             routes: [
    //               GoRoute(
    //                 name: 'detail',
    //                 path: 'detail',
    //                 parentNavigatorKey: _rootNavigatorKey,
    //                 pageBuilder: (context, state) {
    //                   final product = state.extra as Product;
    //                   return MaterialPage(child: ProductDetailScreen(product: product));
    //                 },
    //               )
    //             ]),
    //       ]),
    //       StatefulShellBranch(navigatorKey: _likeNavigatorKey, routes: [
    //         GoRoute(
    //           name: 'like',
    //           path: '/like',
    //           pageBuilder: (context, state) => NoTransitionPage(
    //             key: state.pageKey,
    //             child: const LikePage(),
    //           ),
    //         ),
    //       ]),
    //       StatefulShellBranch(navigatorKey: _cartNavigatorKey, routes: [
    //         GoRoute(
    //           name: 'cart',
    //           path: '/cart',
    //           pageBuilder: (context, state) => NoTransitionPage(
    //             key: state.pageKey,
    //             child: const CartPage(),
    //           ),
    //         ),
    //       ]),
    //       StatefulShellBranch(
    //         navigatorKey: _profileNavigatorKey,
    //         routes: [
    //           GoRoute(
    //             name: 'profile',
    //             path: '/profile',
    //             pageBuilder: (context, state) => NoTransitionPage(
    //               key: state.pageKey,
    //               child: const ProfilePage(),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    //   GoRoute(
    //     name: 'top',
    //     path: '/top',
    //     pageBuilder: (context, state) => MaterialPage(
    //       key: state.pageKey,
    //       child: const TopScreen(),
    //     ),
    //     routes: [
    //       // サブルートへの画面遷移のサンプル
    //       GoRoute(
    //         name: 'signin',
    //         path: 'signin',
    //         pageBuilder: (context, state) => MaterialPage(
    //           key: state.pageKey,
    //           child: const SigninScreen(),
    //         ),
    //       ),
    //       GoRoute(
    //         name: 'signup',
    //         path: 'signup',
    //         pageBuilder: (context, state) => MaterialPage(
    //           key: state.pageKey,
    //           child: const SignupScreen(),
    //         ),
    //       ),
    //     ],
    //   ),
    // ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(
        message: state.error!.message,
      ),
    ),
    redirect: (context, state) {
      final isSignedIn = ref.watch(authProvider).isSignedIn;
      if (!isSignedIn) {
        return '/top';
      }
      return null;
    },
  ),
);

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: [
        TypedGoRoute<HomeRouteData>(
          path: Routes.home,
          routes: [
            TypedGoRoute<DetailRouteData>(path: Routes.detail),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<LikeBranch>(
      routes: [
        TypedGoRoute<LikeRouteData>(path: Routes.like),
      ],
    ),
    TypedStatefulShellBranch<CartBranch>(
      routes: [
        TypedGoRoute<CartRouteData>(path: Routes.cart),
      ],
    ),
    TypedStatefulShellBranch<ProfileBranch>(
      routes: [
        TypedGoRoute<ProfileRouteData>(path: Routes.profile),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppNavigationBar(
      navigationShell: navigationShell,
    );
  }

  // static Widget $navigatorContainerBuilder(
  //   BuildContext context,
  //   StatefulNavigationShell navigationShell,
  //   List<Widget> children,
  // ) {
  //   return AppNavigationBar(
  //     navigationShell: navigationShell,
  //   );
  // }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _homeNavigatorKey;
}

class LikeBranch extends StatefulShellBranchData {
  const LikeBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _likeNavigatorKey;
}

class CartBranch extends StatefulShellBranchData {
  const CartBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _cartNavigatorKey;
}

class ProfileBranch extends StatefulShellBranchData {
  const ProfileBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _profileNavigatorKey;
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class DetailRouteData extends GoRouteData {
  const DetailRouteData({this.$extra});

  final Product? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductDetailScreen(product: $extra!);
  }
}

class LikeRouteData extends GoRouteData {
  const LikeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LikePage();
  }
}

class CartRouteData extends GoRouteData {
  const CartRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CartPage();
  }
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

@TypedGoRoute<TopRouteData>(
  path: Routes.top,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SigninRouteData>(path: Routes.signin),
    TypedGoRoute<SignupRouteData>(path: Routes.signup),
  ],
)
class TopRouteData extends GoRouteData {
  const TopRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TopScreen();
  }
}

class SigninRouteData extends GoRouteData {
  const SigninRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SigninScreen();
  }
}

class SignupRouteData extends GoRouteData {
  const SignupRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignupScreen();
  }
}
