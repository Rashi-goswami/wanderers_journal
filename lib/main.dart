import 'package:flutter/material.dart';

void main() {
  runApp(const WanderersJournal());
}

class WanderersJournal extends StatelessWidget {
  const WanderersJournal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wanderer\'s Journal',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wanderer\'s Journal'),
        ),
        body: const Center(
          child: Text(
            'Welcome, Wanderer 🌿',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}