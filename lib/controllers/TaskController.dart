import 'package:app_task/controllers/TasksProvider.dart';
import 'package:app_task/models/Task.dart';
import 'package:flutter/material.dart';

saveTask(GlobalKey<FormState> _key, Task task, TasksProvider provider) {
  if (_key.currentState!.validate()) {
    provider.addTask(task);
    return true; // Indica que la tarea se agregó correctamente
  } else {
    return false; // Indica que la validación del formulario falló
  }
}

String? validateField(value) {
  return value == null || value!.isEmpty ? "Este campo es obligatorio" : null;
}

void deleteContact(Task task, TasksProvider provider) {
  provider.removeTask(task);
}
