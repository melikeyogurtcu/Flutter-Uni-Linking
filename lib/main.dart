import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uni_link_example/green_page.dart';
import 'package:uni_link_example/pink_page.dart';
import 'package:uni_links/uni_links.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  @override
  void dispose() {
    super.dispose();
    _sub.cancel();
  }

  Future<void> initUniLinks() async {
    _sub = linkStream.listen((String? link) {
      if (!mounted) return;
      if (link != null) {
        navigateBasedOnLink(link);
      }
    }, onError: (err) {
      // Handle error
    });

    final initialLink = await getInitialLink();
    if (initialLink != null) {
      navigateBasedOnLink(initialLink);
    }
  }

  void navigateBasedOnLink(String link) {
    if (link.contains('greenpage')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GreenPage()),
      );
    } else if (link.contains('pinkpage')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PinkPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deep Link Örneği'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Deep Link', style: TextStyle(fontSize: 30)),
            Text('This is the Home Page', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

