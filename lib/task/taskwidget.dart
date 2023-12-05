

import 'package:flutter/material.dart';
import 'package:pro_man/databace/taskdatabace.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;

  TaskWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.heading),
      subtitle: Text(task.details),
      // Customize the way you want to display other task details
    );
  }
}
