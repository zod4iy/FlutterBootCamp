import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: context.watch<TasksData>().tasks[index].name,
          isChecked: context.watch<TasksData>().tasks[index].isDone,
          checkboxCallback: () {
            context.read<TasksData>().toggleTask(index: index);
          },
        );
      },
      itemCount: context.watch<TasksData>().tasksCount,
    );
  }
}