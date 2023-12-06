// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pro_man/databace/addTaskdatabase.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/bottemNavbar.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/profile/profileList.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentindex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 810,
          width: 450,
          color: Colors.white,
          // color: blue,
          child: Column(
            children: [
              Container(
                height: 195,
                width: 415,
                child: ClipPath(
                  clipper: BottomOvalClipper(),
                  child: Container(
                    color: blue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60, left: 18),
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 156),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 440,
                  width: 415,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: SizedBox(
                          height: 300, width: 330, child: ProfileList()),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 110, 16, 0),
          child: SizedBox(
            height: 190,
            child: Card(
              elevation: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 52),
                    child: Text(
                      'Make you Better',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'compleate the task',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder<int>(
                        future: getCompletedTaskCount(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Text('${snapshot.data} completed'),
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          height: 30,
                          width: 1,
                          color: blue,
                        ),
                      ),
                      FutureBuilder<int>(
                        future: getPendingTaskCount(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text('${snapshot.data} pending'),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 41,
                backgroundImage: AssetImage('assets/person avatar.jpg'),
              ),
              SizedBox(
                width: 10,
                height: 50,
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
