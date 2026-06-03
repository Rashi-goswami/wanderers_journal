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

class Task {
  String name;
  bool completed;

  Task({
    required this.name,
    this.completed = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(name: "Linux Learning"),
    Task(name: "DSA Practice"),
    Task(name: "Gym"),
  ];

  double getProgress() {
    if (tasks.isEmpty) return 0;

    int completed =
        tasks.where((task) => task.completed).length;

    return (completed / tasks.length) * 100;
  }

  void addTask(String taskName) {
    if (taskName.trim().isEmpty) return;

    setState(() {
      tasks.add(Task(name: taskName));
    });
  }

  void showAddTaskDialog() {
    TextEditingController controller =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Task"),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Enter task name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                addTask(controller.text);
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = getProgress();

    return Scaffold(
      appBar: AppBar(
        title: const Text("🌿 Wanderer's Journal"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Tasks",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(tasks[index].name),
                    value: tasks[index].completed,
                    onChanged: (value) {
                      setState(() {
                        tasks[index].completed =
                            value ?? false;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Progress: ${progress.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: progress / 100,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}