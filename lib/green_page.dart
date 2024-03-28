import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  const GreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Green Page'),
      ),
      body: const Center(
        child: Text('This is the Green Page',style: TextStyle(fontSize: 20)),
      ),
    );
  }
}