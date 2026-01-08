import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collection = "tasks";

  // Get tasks for the user (by email)
  Stream<List<TaskModel>> getTasks(String email) {
    return _db
        .collection(collection)
        .where('users', arrayContains: email)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TaskModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  Future<void> addTask(String title, String ownerId, String ownerEmail) async {
    final doc = _db.collection(collection).doc();
    final task = TaskModel(
      id: doc.id,
      title: title,
      ownerId: ownerId,
      ownerEmail: ownerEmail,
      users: [ownerEmail],
      completed: false,
    );
    await doc.set(task.toMap());
  }

  Future<void> updateTask(String taskId, String newTitle) async {
    await _db.collection(collection).doc(taskId).update({'title': newTitle});
  }

  Future<void> deleteTask(String taskId) async {
    await _db.collection(collection).doc(taskId).delete();
  }

  Future<void> toggleComplete(String taskId, bool completed) async {
    await _db.collection(collection).doc(taskId).update({
      'completed': completed,
    });
  }

  Future<void> shareTask(String taskId, String email) async {
    await _db.collection(collection).doc(taskId).update({
      'users': FieldValue.arrayUnion([email]),
    });
  }
}
