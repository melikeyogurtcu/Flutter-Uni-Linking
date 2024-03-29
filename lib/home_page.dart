import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uni_link_example/green_page.dart';
import 'package:uni_link_example/pink_page.dart';
import 'package:uni_links/uni_links.dart';

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
        title: const Text('Deep Link Example'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Deep Link', style: TextStyle(fontSize: 30)),
            const Text('This is the Home Page', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PinkPage()),
        );
      },
      child: const Icon(Icons.home, size: 50, color: Colors.pink),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GreenPage()),
        );
      },
      child: const Icon(Icons.home, size: 50, color: Colors.green),
    ),
  ],
)
          ],
        ),
      ),
    );
  }
}

