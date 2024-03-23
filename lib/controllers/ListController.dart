import 'package:app_task/models/Task.dart';

List<Task> getTasks() {
  return [
    Task(title: 'Task 1', description: 'Test 1'),
    Task(title: 'Task 2', description: 'Test 2'),
    Task(title: 'Task 3', description: 'Test 3'),
  ];
}
