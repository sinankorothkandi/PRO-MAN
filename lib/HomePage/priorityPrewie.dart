// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pro_man/HomePage/functionsinhome.dart';
import 'package:pro_man/HomePage/homePage.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/color.dart';


class TaskPreview extends StatefulWidget {
  final TaskModel selectedTask;
  TaskPreview({required this.selectedTask, Key? key}) : super(key: key);

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  late TaskModel selectedTask;
  double progressValue = 0.7;
  List<TaskModel> tasks = [];

  late DateTime? startDate;
  late DateTime? endDate;

  @override
  void initState() {
    super.initState();
    selectedTask = widget.selectedTask;
    loadTasks();

    startDate = selectedTask.startDates != null
        ? DateTime.parse(selectedTask.startDates!)
        : null;
    endDate = selectedTask.endDates != null
        ? DateTime.parse(selectedTask.endDates!)
        : null;

    updateProgressValue();
  }

  Future<void> loadTasks() async {
    final taskBox = await Hive.openBox<TaskModel>('tasks_db');
    setState(() {
      tasks = taskBox.values.toList();
      updateProgressValue();
    });
  }

  void updateProgressValue() {
    setState(() {
      progressValue = calculateProgressValue();
    });
  }

  double calculateProgressValue() {
    int completedSubtasks = widget.selectedTask.subtasks
        .where((subtask) => subtask.isCompleted)
        .length;
    int totalSubtasks = widget.selectedTask.subtasks.length;
    return totalSubtasks > 0 ? completedSubtasks / totalSubtasks : 0.0;
  }

  String calculateMonthsRemaining(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return 'N/A';

    final difference = endDate.difference(startDate);
    final months = difference.inDays ~/ 30;
    return months.toString();
  }

  String calculateDaysRemaining(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return 'N/A';

    final difference = endDate.difference(startDate);
    final days = difference.inDays % 30;
    return days.toString();
  }

  String calculateHoursRemaining(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return 'N/A';

    final difference = endDate.difference(startDate);
    final hours = difference.inDays % 24;
    return hours.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 890,
          width: 380,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Text(
                      selectedTask.heading,
                      style: TextStyle(
                          fontSize: 26,
                          color: blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      height: 39,
                      width: 39,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => HomePage()));
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'start',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'end',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${startDate != null ? DateFormat('dd MMM yyyy').format(startDate!) : 'N/A'} ",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${endDate != null ? DateFormat('dd MMM yyyy').format(endDate!) : 'N/A'} ",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(calculateMonthsRemaining(startDate, endDate),
                                style: TextStyle(
                                    fontSize: 54,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text(
                              'months',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ]),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(calculateDaysRemaining(startDate, endDate),
                                style: TextStyle(
                                    fontSize: 54,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text(
                              'days',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ]),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(calculateHoursRemaining(startDate, endDate),
                                style: TextStyle(
                                    fontSize: 54,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text(
                              'hours',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description',
                      style: TextStyle(fontSize: 18),
                    )),
                SizedBox(
                  height: 9,
                ),
                Text(
                  selectedTask.details,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 29,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Progress',
                      style: TextStyle(fontSize: 18),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Stack(
                      children: [
                        LinearProgressIndicator(
                          minHeight: 23,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          value: progressValue,
                          backgroundColor: Color.fromARGB(255, 163, 163, 163),
                          valueColor: AlwaysStoppedAnimation<Color>(blue),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${(progressValue * 100).toInt()}%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 29,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'To do List',
                      style: TextStyle(fontSize: 18),
                    )),
                SubtaskListView(
                  subtasks: widget.selectedTask.subtasks,
                  tasks: tasks,
                  updateProgressValue: updateProgressValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

