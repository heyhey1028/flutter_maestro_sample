import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/widgets/app_button.dart';
import 'package:flutter_maestro_sample/widgets/app_logo.dart';
import 'package:flutter_maestro_sample/widgets/app_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLogo(),
                const SizedBox(height: 24),
                const Text(
                  'Welcom back',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: _emailController,
                        labelText: 'Email address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email address is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        controller: _passwordController,
                        labelText: 'Password',
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                AppButton(
                  height: 48,
                  isLoading: _isLoading,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    final result = await _login(
                      context,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    if (result == null || !mounted) return;
                  },
                  text: 'Continue',
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        context.go('/top/signup');
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      setState(() {
        _isLoading = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
