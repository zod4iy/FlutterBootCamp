import 'package:flutter/material.dart';

class Todo {
  final String title;
  bool isDone = false;

  Todo({
    required this.title,
  });
}

class TaskTile extends StatelessWidget {
  final Todo model;

  const TaskTile({
    Key? key,
    required this.model,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(model.title),
          trailing: Checkbox(
            value: model.isDone,
            onChanged: (bool? value) {  },
          ),
        )
    );
  }
}