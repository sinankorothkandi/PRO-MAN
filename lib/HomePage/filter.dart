// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pro_man/databace/addTaskdatabase.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';


class Filter extends StatefulWidget {
  const Filter({Key? key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();

    loadDataFromHive();
  }

  Future<void> loadDataFromHive() async {
    List<TaskModel> loadedTasks = await getAllTasksFromHive();
    setState(() {
      tasks = loadedTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('History')),
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 20),
          child: DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: Column(
              children: [
                TabBar(
                  labelColor: blue,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 3,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    Tab(
                      child: tabText(
                        'All',
                      ),
                    ),
                    Tab(
                      child: tabText('Completed'),
                    ),
                    Tab(
                      child: tabText('Pending'),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
  children: [
    // Tab 1: All Tasks
    Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.heading),
              );
            },
          ),
        ),
      ],
    ),
    // Tab 2: Completed Tasks
    Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              if (task.dailyTaskcompleate || task.completedSubtasks.contains(true)) {
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

    Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              if (!task.dailyTaskcompleate && !task.completedSubtasks.contains(true)) {
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
  ],
),
                ),
              ],
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
      child: Center(
        child: Text(data,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
