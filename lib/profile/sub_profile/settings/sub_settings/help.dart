// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';


class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('Help')),
      ),
      body: CustomBackground(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 66, right: 180, bottom: 10),
            child: const Text(
              'Tell us how we can help ',
              style: TextStyle(
                  fontSize: 18, color: blue, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: 'Type some message...',
                ),
                maxLines: 12,
              )),
               SizedBox(
              height: 54,
              width: 377,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), 
                  ),
                ),
                child: Text('Send'),
              ),
            ),
        ]),
      ),
    );
  }
}
