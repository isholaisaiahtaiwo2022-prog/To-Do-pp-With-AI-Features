import 'package:flutter/material.dart';
import '../models/task.dart';
import '../service/task_storage.dart';
import '../widget/todo_app_bar.dart';
import '../widget/add_task_bar.dart';
import '../widget/task_tile.dart';
import '../widget/round_add_button.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> _tasks = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await TaskStorage.loadTasks();
    setState(() {
      _tasks = tasks;
      _loading = false;
    });
  }

  Future<void> _persist() async => TaskStorage.saveTasks(_tasks);

  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(id: DateTime.now().toIso8601String(), title: title, isDone: false));
    });
    _persist();
  }

  void _toggleTask(Task task, bool? value) {
    setState(() => task.isDone = value ?? false);
    _persist();
  }

  void _deleteTask(Task task) {
    setState(() => _tasks.remove(task));
    _persist();
  }

  Future<void> _showAddDialog() async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFFFCEB8E),
        title: const Text('New Task'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Task name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                _addTask(controller.text.trim());
              }
              Navigator.pop(ctx);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF7D842),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7D842),
      appBar: const TodoAppBar(),
      body: Column(
        children: [
          AddTaskBar(onAdd: _addTask),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return TaskTile(
                  task: task,
                  onChanged: (value) => _toggleTask(task, value),
                  onDelete: () => _deleteTask(task),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: RoundedAddButton(onpressed: _showAddDialog),
    );
  }
}