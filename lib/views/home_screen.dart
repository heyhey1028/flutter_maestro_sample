import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn = ref.read(authProvider).isSignedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isSignedIn ? const Text('Signed in') : const Text('Not signed in'),
      ),
    );
  }
}
