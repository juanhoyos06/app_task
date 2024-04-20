import 'package:cloud_firestore/cloud_firestore.dart';

class TaskControllerF {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final String collection = "tasks";

  // Crear con id de firebase
  Future<String> create(Map<String, dynamic> task) async {
    DocumentReference response = await db.collection(collection).add(task);
    return response.id;
  }

  // Crear con id propio
  Future<void> createId(Map<String, dynamic> task, String id) async {
    await db.collection(collection).doc(id).set(task);
  }

  // Actualizar
  Future<void> updateMerge(Map<String, dynamic> task, String id) async {
    await db.collection(collection).doc(id).set(task, SetOptions(merge: true));
  }

  Future<void> update(Map<String, dynamic> task, String id) async {
    await db.collection(collection).doc(id).update(task);
  }

  //delete
  Future<void> remove(String id) async {
    await db.collection(collection).doc(id).delete();
  }

  // select
  // Future<void> getTask() async {
  //   QuerySnapshot snapshot = await db.collection(collection).get();
  //   for (var doc in snapshot.docs) {
  //     print(doc.id);
  //     print(doc.data() as Map<String, dynamic>);
  //   }
  //   return snapshot.docs;
  // }
}
