// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pro_man/HomePage/homePage.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/profile/profile.dart';
import 'package:pro_man/task/taskpage.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: blue,
          unselectedItemColor: const Color.fromARGB(255, 99, 153, 197),
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                       HomePage(),
                ),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                         TaskPage(),
                ),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage()
                ),
              );
            
          } 
            //else {
            //   onTap(index);
            // }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded,size: 32),
              label: 'task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,size: 35),
              label: 'profile',
            ),
          ],
        ),
      ],
    );
  }
}


