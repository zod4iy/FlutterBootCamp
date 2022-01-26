import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get tasksCount {
    return tasks.length;
  }

  void addTask({required Task task}) {
    tasks.add(task);
    notifyListeners();
  }

  void toggleTask({required int index}) {
    tasks[index].toggleDone();
    notifyListeners();
  }
}