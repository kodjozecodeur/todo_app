import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(Title: "Learn Flutter", isCompleted: false),
    Task(Title: "Drink water", isCompleted: false),
  ];

  List<Task> get tasks => _tasks;
  // add task
  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  //check task

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }

  //remove task
  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
