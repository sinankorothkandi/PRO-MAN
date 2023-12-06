// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_man/HomePage/filter.dart';
import 'package:pro_man/HomePage/listview.dart';
import 'package:pro_man/databace/taskdatabace.dart';
import 'package:pro_man/functions/bottemNavbar.dart';
import 'package:pro_man/functions/color.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<TaskModel> tasks = [];
  DateTime? date;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 63, left: 30),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat('MMM,dd,yyyy')
                            .format(date ?? DateTime.now()),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Filter()));
                      },
                      icon: Icon(
                        Icons.history_edu,
                        color: blue,
                        size: 29,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 175),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                  Text(
                    'Have a nice day !',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220, bottom: 5),
              child: Text(
                'Priority Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            SizedBox(height: 235, width: 400, child: HorizontalListView()),
            Padding(
              padding: const EdgeInsets.only(right: 260, top: 30),
              child: Text(
                'Daily Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
           
            VerticalListViewWidget(),
          ],
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
}
