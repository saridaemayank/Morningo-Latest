import 'package:flutter/material.dart';
import 'package:morningo/Pages/Tools/TodoPage/task.dart';
import 'Tasks_Tile.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy Bread'),
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TasksTile(
          taskTitle: tasks[0].name,
          isChecked: tasks[0].isDone,
        ),
        TasksTile(
          taskTitle: tasks[1].name,
          isChecked: tasks[1].isDone,
        ),
        TasksTile(
          taskTitle: tasks[2].name,
          isChecked: tasks[2].isDone,
        ),
      ],
    );
  }
}
