import 'package:app_task/controllers/TaskController.dart';
import 'package:app_task/controllers/TasksProvider.dart';
import 'package:app_task/models/Task.dart';
import 'package:app_task/views/ListTasksPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CreateTaskPage extends StatelessWidget {
  String title = "Crear Tarea";
  final GlobalKey<FormState> _key = GlobalKey();
  Task task = Task.empty();

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
        builder: (_, TasksProvider provider, child) {
          return formTask(provider, context);
        },
      ),
    );
  }

  Form formTask(TasksProvider provider, BuildContext context) {
    return Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => task.title = value,
                validator: validateField,
                decoration: const InputDecoration(
                  labelText: "Titulo",
                  hintText: "Ingrese el titulo de la tarea",
                ),
              ),
              TextFormField(
                onChanged: (value) => task.description = value,
                validator: validateField,
                decoration: const InputDecoration(
                  labelText: "Descripcion",
                  hintText: "Ingrese la descripcion de la tarea",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  saveTask(task);

                  openDialog(context);
                },
                child: const Text("Guardar"),
              )
            ],
          ),
        ));
  }

  Future<dynamic> openDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Tarea guardada'),
            content: const Text('La tarea se ha guardado correctamente'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListTasksPage(),
                    ));
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
