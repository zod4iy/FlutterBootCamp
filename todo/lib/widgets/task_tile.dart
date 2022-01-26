import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final void Function()? longPressCallback;

  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          onLongPress: longPressCallback,
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
