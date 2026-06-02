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
      title: "Wanderer's Journal",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool linux = false;
  bool dsa = false;
  bool gym = false;

  double getProgress() {
    int completed = 0;

    if (linux) completed++;
    if (dsa) completed++;
    if (gym) completed++;

    return (completed / 3) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🌿 Wanderer's Journal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Tasks",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            CheckboxListTile(
              title: const Text("Linux Learning"),
              value: linux,
              onChanged: (value) {
                setState(() {
                  linux = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("DSA Practice"),
              value: dsa,
              onChanged: (value) {
                setState(() {
                  dsa = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Gym"),
              value: gym,
              onChanged: (value) {
                setState(() {
                  gym = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            Text(
              "Progress: ${getProgress().toStringAsFixed(0)}%",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: getProgress() / 100,
            ),
          ],
        ),
      ),
    );
  }
}