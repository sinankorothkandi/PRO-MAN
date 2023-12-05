// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pro_man/databace/database.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/functions/color.dart';


class MyProfile extends StatefulWidget {
  final UserModel? user;

  const MyProfile({this.user, Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController professionController = TextEditingController();
  String profession = "";
  late UserModel? user;
  DateTime? dob;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    loadUserDataFromHive();
  }

  Future<void> loadUserDataFromHive() async {
  final taskBox = await Hive.openBox<UserModel>('users');
  if (taskBox.isNotEmpty) {
    setState(() {
      // Assuming there is only one user in the database
      user = taskBox.getAt(0);
      if (user != null) {
        professionController.text = user!.profession ?? '';
        dob = user!.dob != null ? DateTime.parse(user!.dob!) : null;
      }
    });
  }
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('My Profile')),
      ),
      body: CustomBackground(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: CircleAvatar(
                  radius: 41,
                  backgroundImage: AssetImage('assets/person avatar.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 150,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 163),
                      child: Text(
                        user?.username ?? 'Default Username',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 45),
                      child: Text(
                        user?.username ?? 'No Email',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 150,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 129),
                      child: const Text(
                        'Profession',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: blue),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: TextFormField(
                        controller: professionController,
                        decoration: InputDecoration(
                          hintText: 'Eg:- Flutter Developer ',
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 150,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 118),
                      child: const Text(
                        'Date Of Birth',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: blue),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              final pickedDate =
                                  await showCalendarDialog(context);
                              if (pickedDate != null) {
                                setState(() {
                                  dob = pickedDate;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: blue,
                            ),
                          ),
                          dob != null
                              ? Text(
                                  DateFormat('yyyy-MM-dd').format(dob!),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                )
                              : Text(
                                  DateFormat('eg:- yyyy-MM-dd')
                                      .format(DateTime.now()),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 150,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 173),
                      child: const Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: blue),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: Text(
                        user?.email ?? 'No Email',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 65,
              ),
              SizedBox(
                height: 54,
                width: 377,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() || dob != null) {
                      final profession = professionController.text;
                      final Dob = dob?.toString() ?? '';
                      saveSignupDetails(profession, Dob);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
