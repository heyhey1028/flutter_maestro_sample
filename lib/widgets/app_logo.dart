import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.radius = 50,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Test',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: const AssetImage('assets/images/flutter_logo.png'),
        radius: radius,
      ),
    );
  }
}
