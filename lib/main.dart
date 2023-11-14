import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Flutter Maestro Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      // GoRouterクラスからrouteInformationProvider,routerInformationnParser, routerDelegateを渡す
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
