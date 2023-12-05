// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';


class AppInfo extends StatefulWidget {
  const AppInfo({super.key});

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('App Info')),
      ),
      body: CustomBackground(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 150),
              child: SizedBox(
                height: 180,width: 420,
               child: Image.asset
               ('assets/Screenshot 2023-10-12 151615.png'),),
            ),
            Center(
            child: Column(
              children: [
                Text('vertion 1.0.0',style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                Text('@2022 PRO-MAN',style: TextStyle(fontSize: 12),),
                SizedBox(height: 40,),
                SizedBox(
              height: 44,
              width: 177,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), 
                  ),
                ),
                child: Text('Licenses'),
              ),
            ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}