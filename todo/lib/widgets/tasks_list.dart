import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  List<Todo> _todoItems = [
    Todo(title: 'Buy milk'),
    Todo(title: 'Go gym'),
    Todo(title: 'Buy eggs'),
  ];

  TasksList({Key? key}) : super(key: key);

  List<TaskTile> _buildTodoItemList({required List<Todo> items}) {
    List<TaskTile> widgetList = [];
    for (Todo item in items) {
      widgetList.add(TaskTile(model: item));
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTodoItemList(items: _todoItems),
    );
  }
}