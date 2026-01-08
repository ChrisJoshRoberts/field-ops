import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(child: Text('Login Screen')),
          ElevatedButton(
            onPressed: () => context.go('/app'),
            child: Text('Go to Home Screen'),
          ),
        ],
      ),
    );
  }
}
