import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Field Ops')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Center(child: Text('Home Screen')),
          ElevatedButton(
            onPressed: () => context.go('/login'),
            child: Text('Go to Login Screen'),
          ),
        ],
      ),
    );
  }
}
