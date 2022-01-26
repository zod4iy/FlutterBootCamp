import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {

  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(
            'Task number ?',
            style: TextStyle(
               decoration: isChecked ? TextDecoration.lineThrough : null,
            )
          ),
          trailing: TaskCheckbox(
            checkboxState: isChecked,
            toggleCheckboxState: (bool? checkboxState) {
              setState(() {
                isChecked = checkboxState ?? false;
              });
            },
          ),
        )
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final void Function(bool?) toggleCheckboxState;

  TaskCheckbox({
    required this.checkboxState,
    required this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}