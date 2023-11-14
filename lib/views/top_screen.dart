import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/views/sign_in_screen.dart';
import 'package:flutter_maestro_sample/views/sign_up_screen.dart';
import 'package:flutter_maestro_sample/widgets/app_logo.dart';

import '../widgets/app_button.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogo(),
              const SizedBox(height: 24),
              const Text('Welcome to SupaGPT'),
              const SizedBox(height: 16),
              const Text('Log in with your account to continue'),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    width: 80,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
                    },
                    text: 'Log in',
                  ),
                  const SizedBox(width: 16),
                  AppButton(
                    width: 80,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    text: 'Sign up',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
