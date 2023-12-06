import 'package:flutter/material.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/color.dart';

class SubtaskListView extends StatefulWidget {
  final List<Subtask> subtasks;
  final List<TaskModel> tasks;
  final Function updateProgressValue;

  SubtaskListView({
    required this.subtasks,
    required this.tasks,
    required this.updateProgressValue,
    Key? key,
  }) : super(key: key);

  @override
  _SubtaskListViewState createState() => _SubtaskListViewState();
}

class _SubtaskListViewState extends State<SubtaskListView> {
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: widget.subtasks.length,
        itemBuilder: (context, index) {
          final subtask = widget.subtasks[index];
          
          return GestureDetector(
            onTap: () {
              setState(() {
                subtask.isCompleted = !subtask.isCompleted;
                widget.updateProgressValue();
                print(subtask.isCompleted);
              });
            },
            child: ListTile(
              title: Text(
                subtask.description,
                style: TextStyle(
                  color: subtask.isCompleted == true ? blue : Colors.black,
                  fontSize: 18,
                ),
              ),
              trailing: Icon(
                subtask.isCompleted == true
                    ? Icons.radio_button_checked_sharp
                    : Icons.radio_button_off,
                color: blue,
              ),
            ),
          );
        },
      ),
    );
  }
}
