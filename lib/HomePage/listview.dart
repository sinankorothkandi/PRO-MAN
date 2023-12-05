// ignore_for_file: prefer_const_constructors, must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pro_man/HomePage/dailyPreview.dart';
import 'package:pro_man/HomePage/priorityPrewie.dart';
import 'package:pro_man/databace/addTaskdatabase.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/color.dart';

class VerticalListViewWidget extends StatelessWidget {
  List<TaskModel> tasks = [];

  VerticalListViewWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TaskModel>('tasks_db').listenable(),
      builder: (context, Box<TaskModel> box, child) {
        tasks = box.values.toList();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            height: 270,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                if (task.heading.isNotEmpty) {
                  if (task.subtasks.isEmpty) {
                    return GestureDetector(
                      onTap: () {
                        task.dailyTaskcompleate = !task.dailyTaskcompleate;
                        task.save();
                        print(tasks[index].dailyTaskcompleate);
                        if (task.subtasks.isNotEmpty) {
                          for (var subtask in task.subtasks) {
                            subtask.isCompleted = task.dailyTaskcompleate;
                            subtask.save();
                          }
                        }
                      },
                      onLongPress: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Delete ${task.heading} task'),
                          ),
                        );

                        deleteTask(task.key);
                      },
                      child: ListTile(
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        dailyPreview(selectedTask: task)));
                          },
                          child: Text(
                            task.heading,
                            style: TextStyle(
                                color: task.dailyTaskcompleate == true
                                    ? blue
                                    : Colors.black,
                                fontSize: 18),
                          ),
                        ),
                        trailing: Icon(
                          task.dailyTaskcompleate == true
                              ? Icons.radio_button_checked_sharp
                              : Icons.radio_button_off,
                          color: blue,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink(
                        );
                  }
                }else{

                }
              },
            ),
          ),
        );
      },
    );
  }
}

class HorizontalListView extends StatefulWidget {
  const HorizontalListView({super.key});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  List<TaskModel> tasks = [];

  final List<String> backgroundImages = [
    'assets/menu1.png',
    'assets/menu2.png',
    'assets/menu4.png',
    'assets/menu3.png',
    'assets/menu5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TaskModel>('tasks_db').listenable(),
      builder: (context, Box<TaskModel> box, child) {
        tasks = box.values.toList();

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            if (task.subtasks.isNotEmpty) {
              final backgroundImageIndex = index % backgroundImages.length;

              double progressValue = calculateProgressValue(task.subtasks);
              String remainingDays = calculateRemainingDays(task.endDates);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TaskPreview(selectedTask: task),
                    ),
                  );
                },
                child: Container(
                  width: 135,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(backgroundImages[backgroundImageIndex]),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70, top: 10),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 245, 245),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            remainingDays,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                task.heading,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              SizedBox(height: 50),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 60, bottom: 5),
                                child: Text('Progress',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.white)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: LinearProgressIndicator(
                                  value: progressValue,
                                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 88),
                                child: Text('${(progressValue * 100).toInt()}%',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }

  double calculateProgressValue(List<Subtask> subtasks) {
    int completedSubtasks =
        subtasks.where((subtask) => subtask.isCompleted).length;
    int totalSubtasks = subtasks.length;
    return totalSubtasks > 0 ? completedSubtasks / totalSubtasks : 0.0;
  }

  String calculateRemainingDays(String? endDate) {
    if (endDate == null) return 'N/A';

    final DateTime now = DateTime.now();
    final DateTime endDateTime = DateTime.parse(endDate);
    final Duration difference = endDateTime.difference(now);

    final int remainingDays = difference.inDays;
    if (remainingDays > 0) {
      return '$remainingDays days ';
    } else {
      return 'Finishd';
    }
  }
}
