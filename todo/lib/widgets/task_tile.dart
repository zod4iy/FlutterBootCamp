import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;

  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(
              taskTitle,
              style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null,
              )
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: (newValue) {
              checkboxCallback();
            },
          ),
        )
    );
  }
}
