// GoRouterクラスはRiverpodで依存注入
import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/app_route_data.dart';
import 'package:flutter_maestro_sample/global/routes.dart';
import 'package:flutter_maestro_sample/views/error_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final likeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'like');
final cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');
final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
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
    // redirect: (context, state) {
    //   final cartEmpty = ref.watch(cartProvider).isEmpty;
    //   if ((state.path?.startsWith(Routes.cart) ?? false) && cartEmpty) {
    //     return Routes.cart;
    //   }
    //   return null;
    // },
  );
}
