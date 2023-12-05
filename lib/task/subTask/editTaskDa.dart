// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/task/subTask/dateSelect.dart';
import 'package:pro_man/task/taskpage.dart';


class EditPageDaily extends StatefulWidget {
   final TaskModel task;
  const EditPageDaily({super.key, required this.task});

  @override
  State<EditPageDaily> createState() => _EditPageDailyState();
}

class _EditPageDailyState extends State<EditPageDaily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('Edit Task')),
      ),
      body: CustomBackground(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Task Name',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 35, color: blue),
              ),
            ),
            DateSelect( startDate: widget.task.startDates ?? '', 
                endDate: widget.task.endDates ?? '',),
            Padding(
              padding: EdgeInsets.only(top: 36, right: 310, bottom: 5),
              child: Text(
                'Title ',
                style: TextStyle(
                    fontSize: 18, color: blue, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Task title...',
                  border: InputBorder.none,
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 270),
              child: Text(
                'Category ',
                style: TextStyle(
                    fontSize: 18, color: blue, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(' Daily Task'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26, right: 250, bottom: 5),
              child: Text(
                'Description ',
                style: TextStyle(
                    fontSize: 18, color: blue, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 20, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Description about your task...',
                ),
                maxLines: 7,
              ),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => TaskPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Edit Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
