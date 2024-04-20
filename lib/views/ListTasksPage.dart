import 'package:app_task/controllers/TasksProvider.dart';
import 'package:app_task/models/Task.dart';
import 'package:app_task/views/CreateTaskPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTasksPage extends StatelessWidget {
  String title = "Lista de Tareas";
  late TasksProvider provider;
  late Function(bool) onChanged;
  late Function(int index) onDelete;
  late int index;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 40, 194, 255),
      ),
      body: Consumer<TasksProvider>(
        builder: (_, taskProvider, child) {
          provider = taskProvider;
          return getBody(taskProvider);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateTaskPage(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  getBody(TasksProvider provider) {
    List<Task> tasks = provider.tasks;

    if (tasks.isEmpty) {
      return const Center(
        child: Text('No hay tareas disponibles'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          Task task = tasks[index];
          return taskWidget(task);
        },
      ),
    );
  }

  Widget taskWidget(Task task) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(5),
          title: Text(
            task.title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            task.description,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
          leading: Checkbox(
            value: task.check,
            onChanged: (value) => onChanged(value ?? false),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => provider.removeTask(task)),
            ],
          ),
        ),
      ),
    );
  }
}
