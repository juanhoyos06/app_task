import 'package:app_task/controllers/TasksProvider.dart';
import 'package:app_task/models/Task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

const String collection = "tasks";

Future<String?> saveTask(Task task) async {
  try {
    return db.collection(collection).add(task.toMap()).toString();
  } catch (e) {
    return null;
  }
}

get() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await db.collection("tasks").get();


  return querySnapshot.docs;
}

String? validateField(value) {
  return value == null || value!.isEmpty ? "Este campo es obligatorio" : null;
}

void deleteContact(Task task, TasksProvider provider) {
  provider.removeTask(task);
}
