import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

// Saves and Load the task List as a JSON under one key,
class TaskStorage {
  static const _key = 'tasks';

  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    final List decoded = jsonDecode(raw);
    return decoded.map((e) => Task.fromJson(e)).toList();
  }

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(tasks.map((t) => t.toJson()).toList());
    await prefs.setString(_key,raw);
  }
}
