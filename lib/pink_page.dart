import 'package:flutter/material.dart';

class PinkPage extends StatelessWidget {
  const PinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text('Pink Page'),
      ),
      body: const Center(
        child: Text('This is the Pink Page',style: TextStyle(fontSize: 20)),
      ),
    );
  }
}