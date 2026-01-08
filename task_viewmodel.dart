import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_services.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskService _service = TaskService();
  bool isLoading = false;

  Stream<List<TaskModel>> tasksStream(String email) {
    return _service.getTasks(email);
  }

  Future<void> addTask(String title, String ownerId, String ownerEmail) async {
    isLoading = true;
    notifyListeners();
    await _service.addTask(title, ownerId, ownerEmail);
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateTask(String taskId, String newTitle) async {
    await _service.updateTask(taskId, newTitle);
  }

  Future<void> deleteTask(String taskId) async {
    await _service.deleteTask(taskId);
  }

  Future<void> toggleComplete(String taskId, bool completed) async {
    await _service.toggleComplete(taskId, completed);
  }

  Future<void> shareTask(String taskId, String email) async {
    await _service.shareTask(taskId, email);
  }
}
