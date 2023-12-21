import 'package:flutter/material.dart';
import 'package:to_do_using_provider/models/todo_model.dart';

class task_provider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  List<Task> get favoriteTasks =>
      _tasks.where((task) => task.isFavourite).toList();

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleTaskCompletion(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    _tasks[taskIndex] = Task(
      id: _tasks[taskIndex].id,
      title: _tasks[taskIndex].title,
      isCompleted: !_tasks[taskIndex].isCompleted,
    );
    notifyListeners();
  }

  void favouriteTask(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    _tasks[taskIndex] = Task(
      id: _tasks[taskIndex].id,
      title: _tasks[taskIndex].title,
      isCompleted: _tasks[taskIndex].isCompleted,
      isFavourite: !_tasks[taskIndex].isFavourite,
    );

    notifyListeners();
  }
}
