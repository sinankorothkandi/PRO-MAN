// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, use_build_context_synchronously, avoid_print, prefer_null_aware_operators, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_man/databace/addTaskdatabase.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/task/taskpage.dart';


class AddPageDaily extends StatefulWidget {
  AddPageDaily({Key? key}) : super(key: key);

  @override
  State<AddPageDaily> createState() => _AddPageDailyState();
}

int num = 0;

class _AddPageDailyState extends State<AddPageDaily> {
  final TextEditingController headingController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController subtasksController = TextEditingController();
  bool isPopupOpen = false;
  bool isDailyTaskVisible = false;
  bool isSubTaskAdd = false;
   bool isPriortyTaskAdd = false;
  bool isDailyTaskAdd = false;

  String details = "";
  String heading = "";
  // List<Subtask> subtasksList = [];
  List<Subtask> subtasksList = [];

  static Future<DateTime?> showCalendarDialog(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    return pickedDate;
  }

  void _addSubtask(String taskText) {
    if (taskText.isNotEmpty) {
      print(taskText);
      setState(() {
        subtasksList.add(Subtask(
          description: taskText,
        ));
      });
    }
  }

  DateTime? startDate;
  DateTime? endDate;

  final _formKey = GlobalKey<FormState>();
  final _popupformKey = GlobalKey<FormState>();

  //===========================

  void _openPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 270,
            width: 280,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _popupformKey,
                  child: TextFormField(
                    controller: subtasksController,
                    decoration: InputDecoration(
                      labelText: 'Add Sub Task...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Subtask';
                      }
                    },
                  ),
                ),
                SizedBox(height: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 278,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_popupformKey.currentState!.validate()) {
                            _addSubtask(subtasksController.text);
                            subtasksController.clear();
                            Navigator.of(context).pop();
                            isSubTaskAdd = true;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Text('Add Task',style: TextStyle(color: Colors.white),),
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
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Text('Cancel',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void alert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Please choose Dates'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('Add Task')),
      ),
      body: Container(
        height: 850,
        width: 450,
        color: blue,
        child: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            height: 814,
            width: 415,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 25,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final pickedDate =
                                        await showCalendarDialog(context);
                                    if (pickedDate != null) {
                                      setState(() {
                                        startDate = pickedDate;
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month,
                                    color: blue,
                                  ),
                                ),
                                startDate != null
                                    ? Text(
                                        DateFormat('yyyy-MMM-dd')
                                            .format(startDate!),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    : Text(
                                        DateFormat('yyyy-MMM-dd')
                                            .format(DateTime.now()),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                      //===================================

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 70,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 90),
                              child: const Text(
                                'End',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final pickedDate =
                                        await showCalendarDialog(context);
                                    if (pickedDate != null) {
                                      setState(() {
                                        endDate = pickedDate;
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month,
                                    color: blue,
                                  ),
                                ),
                                endDate != null
                                    ? Text(
                                        DateFormat('yyyy-MMM-dd')
                                            .format(endDate!),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                                    : Text(
                                        DateFormat('yyyy-MMM-dd')
                                            .format(DateTime.now()),
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26, right: 310, bottom: 5),
                    child: Text(
                      'Title ',
                      style: TextStyle(
                          fontSize: 18,
                          color: blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: TextFormField(
                      controller: headingController,
                      onChanged: (value) {
                        setState(() {
                          heading = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Task title...',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Title';
                        }
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30, right: 270),
                        child: Text(
                          'Category ',
                          style: TextStyle(
                            fontSize: 18,
                            color: blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultTabController(
                        length: 2,
                        initialIndex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: Colors.white,
                                unselectedLabelColor: blue,
                                tabs: [
                                  Tab(
                                    child: tabText('Priority Task'),
                                  ),
                                  Tab(
                                    child: tabText('Daily Task'),
                                  ),
                                ],
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blue,
                                ),
                              ),
                              SizedBox(
                                height: 450,
                                child: TabBarView(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDailyTaskVisible = false;
                                        });
                                        print(isDailyTaskVisible);
                                      },
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 26,
                                                  right: 250,
                                                  bottom: 5),
                                              child: Text(
                                                'Description ',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 30,
                                                right: 30,
                                                top: 20,
                                                bottom: 10,
                                              ),
                                              child: TextFormField(
                                                controller: detailsController,
                                                onChanged: (value) {
                                                  setState(() {
                                                    details = value;
                                                  });
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      'Description about your task...',
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'enter Description';
                                                  }
                                                },
                                                maxLines: 6,
                                              ),
                                            ),
                                            isSubTaskAdd
                                                ? Row(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 25,
                                                                right: 220,
                                                                left: 18,
                                                                bottom: 5),
                                                        child: Text(
                                                          'To Do List ',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: blue,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        height: 38,
                                                        width: 38,
                                                        decoration: BoxDecoration(
                                                            color: blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                        child: IconButton(
                                                            onPressed: () {
                                                              _openPopup();
                                                            },
                                                            icon: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      )
                                                    ],
                                                  )
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 25,
                                                        right: 230,
                                                        bottom: 5),
                                                    child: Text(
                                                      'To Do List ',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            isSubTaskAdd
                                                ? SizedBox(
                                                    height: 90,
                                                    width: 350,
                                                    child: ListView.builder(
                                                      itemCount:
                                                          subtasksList.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ListTile(
                                                          title: Text(
                                                              subtasksList[
                                                                      index]
                                                                  .description),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 30),
                                                    child: TextFormField(
                                                      onTap: () {
                                                        _openPopup();
                                                      },
                                                      readOnly: true,
                                                      controller:
                                                          subtasksController,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Sub Task...',
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please Add Subtask';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 350,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                          .validate() ||
                                                      endDate != null ||
                                                      startDate != null) {
                                                    TaskModel task =
                                                        TaskModel.createTask(
                                                      heading: heading,
                                                      details: details,
                                                      startDates: startDate !=
                                                              null
                                                          ? startDate
                                                              ?.toIso8601String()
                                                          : null,
                                                      endDates: endDate != null
                                                          ? endDate
                                                              ?.toIso8601String()
                                                          : null,
                                                      subtasks: subtasksList,
                                                    );
                                                    saveTaskDetails(task);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                TaskPage()));
                                                  } else if (startDate ==
                                                          null ||
                                                      endDate == null) {
                                                    alert();
                                                  }
                                                   isPriortyTaskAdd = true;

                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                                child:
                                                    const Text('Create Task',style: TextStyle(color: Colors.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDailyTaskVisible = true;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 26, right: 250, bottom: 5),
                                            child: Text(
                                              'Description ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 40,
                                              right: 40,
                                              top: 20,
                                              bottom: 40,
                                            ),
                                            child: TextFormField(
                                              controller: detailsController,
                                              onChanged: (value) {
                                                setState(() {
                                                  details = value;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                hintText:
                                                    'Description about your task...',
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Description';
                                                }
                                                return null;
                                              },
                                              maxLines: 7,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 350,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  TaskModel task =
                                                      TaskModel.createTask(
                                                    heading: heading,
                                                    details: details,
                                                    startDates: startDate !=
                                                            null
                                                        ? startDate
                                                            ?.toIso8601String()
                                                        : null,
                                                    endDates: endDate != null
                                                        ? endDate
                                                            ?.toIso8601String()
                                                        : null,
                                                    subtasks: subtasksList,
                                                  );

                                                  saveTaskDetails(task);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              TaskPage()));
                                                }
                                                 isDailyTaskAdd = true;
 
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              child: const Text('Create Task',style: TextStyle(color: Colors.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tabText(String data) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text(data)),
    );
  }
}
