import 'package:app_task/models/Task.dart';
import 'package:flutter/material.dart';

class TasksProvider extends ChangeNotifier {

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }




}
