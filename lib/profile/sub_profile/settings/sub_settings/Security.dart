// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';


class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('Security')),
      ),
      body: CustomBackground(
          child: Column(
            children: [
              //================ TEXT==============\\
              Padding(
                padding: EdgeInsets.only(top: 66, right: 275, bottom: 10),
                child: const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 18, color: blue, fontWeight: FontWeight.bold),
                ),
              ),
        
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    SizedBox(
                      height: 48,
                      width: 47,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        child: Container(
                          color: blue,
                          child: Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Current Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    SizedBox(
                      height: 48,
                      width: 47,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        child: Container(
                          color: blue,
                          child: Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    SizedBox(
                      height: 48,
                      width: 47,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        child: Container(
                          color: blue,
                          child: Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 54,
                width: 377,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
