// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_man/databace/addTaskdatabase.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/bottemNavbar.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/task/subTask/addTask.dart';
import 'package:pro_man/task/subTask/editTaskPr.dart';
import 'package:pro_man/task/subTask/colunderLogic.dart' as myapp;

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TaskModel> tasks = [];
  late DateTime selectedDatee;

  @override
  void initState() {
    super.initState();
    selectedDatee = DateTime.now();
    print("selectedDate${selectedDatee}");
    loadDataFromHive();
  }

  Future<void> loadDataFromHive() async {
    List<TaskModel> loadedTasks = await getAllTasksFromHive();
    setState(() {
      tasks = loadedTasks;
    });
  }

  static Future<DateTime?> showCalendarDialog(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    return pickedDate;
  }

  DateTime? startDate;
  DateTime? endDate;
  int currentIndex = 1;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20),
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            final pickedDate =
                                await showCalendarDialog(context);
                            if (pickedDate != null) {
                              setState(() {
                                date = pickedDate;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: blue,
                          ),
                        ),
                        Text(
                          DateFormat('MMM,yyyy').format(date ?? DateTime.now()),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: SizedBox(
                        // height: 40,
                        // width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AddPageDaily()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(
      Icons.add,
      color: Colors.white,
    ),
    Text(
      ' Add Task',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ],
),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: buildHorizontalListView(
                  selectedDatee,
                  onDaySelected,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        const TabBar(
                          labelColor: blue,
                          unselectedLabelColor: Colors.black,
                          indicatorWeight: 3,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 33),
                          tabs: [
                            Tab(
                              child: Text(
                                'Priority Task',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Tab(
                              child: Text('Daily Task',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 500,
                          child: TabBarView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: tasks.length,
                                        itemBuilder: (context, index) {
                                          final task = tasks[index];
                                          if (task.subtasks.isNotEmpty) {
                                            return SizedBox(
                                              height: 195,
                                              width: 300,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 3,
                                                    height: 80,
                                                    color: blue,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              task.heading,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                color: blue,
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      content:
                                                                          SizedBox(
                                                                        height:
                                                                            180,
                                                                        width:
                                                                            280,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 278,
                                                                              height: 60,
                                                                              child: ElevatedButton(
                                                                                onPressed: () {
                                                                                  Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(builder: (_) => EditPagePriority(task: task)),
                                                                                  );
                                                                                },
                                                                                style: ElevatedButton.styleFrom(
                                                                                  backgroundColor: blue,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                ),
                                                                                child: Text('Edit',style: TextStyle(color: Colors.white),),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 278,
                                                                              height: 60,
                                                                              child: ElevatedButton(
                                                                                onPressed: () {
                                                                                  deleteTask(task.key);
                                                                                  Navigator.push(context, MaterialPageRoute(builder: (_) => TaskPage()));
                                                                                },
                                                                                style: ElevatedButton.styleFrom(
                                                                                  backgroundColor: blue,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                ),
                                                                                child: Text('Delete',style: TextStyle(color: Colors.white)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              icon: Icon(
                                                                  Icons
                                                                      .more_horiz,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          120,
                                                                          182,
                                                                          233)),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          task.details,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: Text(
                                                            "${task.startDates != null ? DateFormat('MMM, dd').format(DateTime.parse(task.startDates!)) : 'N/A'} - ${task.endDates != null ? DateFormat('MMM, dd').format(DateTime.parse(task.endDates!)) : 'N/A'}",
                                                            style: TextStyle(
                                                              color: blue,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return SizedBox.shrink();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Daily Task tab
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: tasks.length,
                                        itemBuilder: (context, index) {
                                          final task = tasks[index];
                                          if (task.subtasks.isEmpty) {
                                            return ListTile(
                                              title: Text(task.heading),
                                            );
                                          } else {
                                            return SizedBox.shrink();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  static Widget buildHorizontalListView(
    DateTime selectedDate,
    Function(DateTime) onDaySelected,
  ) {
    return SizedBox(
      height: 78,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: myapp.DateUtils.daysInMonth(selectedDate).length,
        itemBuilder: (context, index) {
          final day = myapp.DateUtils.daysInMonth(selectedDate)[index];
          final isSelected = selectedDate.isAtSameMomentAs(day);

          return InkWell(
            onTap: () {
              onDaySelected(day);
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: isSelected ? blue : Color.fromARGB(255, 255, 255, 255),
              child: Container(
                width: 67,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      myapp.DateUtils.formatDayWithDayName(day),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : blue,
                        fontFamily: 'DelaGothicOne',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onDaySelected(DateTime day) {
    setState(() {
      selectedDatee = day;
    });
  }
}
