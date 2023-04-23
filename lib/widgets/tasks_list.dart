import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoy_flutter/models/task_data.dart';
import 'package:todoy_flutter/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = value.tasks[index];
            return TaskTile(task.isDone,
                task.name,
                checkboxCallback: (checkboxState) {
                value.updateTask(task);
            },
              longPressCallback: () {
                value.deleteTask(task);
              },);
          },
          itemCount: value.taskCount,
        );
      },
    );
  }
}
