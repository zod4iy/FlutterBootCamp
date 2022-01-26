import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  void addTask({required Task task}) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask({required int index}) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask({required int index}) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}