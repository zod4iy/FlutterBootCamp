import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _newTaskName ='';
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                _newTaskName = value;
              },
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                ),
                onPressed: () {
                  if (_newTaskName.isNotEmpty) {
                    context.read<TasksData>().addTask(task: Task(name: _newTaskName));
                    Navigator.pop(context);
                  }
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
