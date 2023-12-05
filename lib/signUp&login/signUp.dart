// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:pro_man/databace/database.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/signUp&login/LogIn.dart';


class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConfirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //================ TEXT==============\\
                    const Text(
                      'PRO-MAN',
                      style: TextStyle(
                          fontSize: 29,
                          color: blue,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('Management App',
                        style: TextStyle(
                          fontSize: 19,
                        )),
                    const SizedBox(
                      height: 80,
                    ),
                    Text('Create your account',
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    //===================user signUp section =======================\\
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
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a Username';
                                }
                                return null;
                              },
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
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: InputBorder.none,
                              ),
                             validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a email address';
                            } else if (!RegExp(
                                    r'^[A-Za-z][A-Za-z0-9._%+-]*@(gmail\.com|outlook\.com|company\.com)$')
                                .hasMatch(value)) {
                              return 'Invalid email format or domain';
                            }
                            return null;
                          },
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
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a Password';
                                }
                                return null;
                              },
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
                              controller: _ConfirmpasswordController,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                border: InputBorder.none,
                              ),
                             validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password again';
                            }
                            if (_ConfirmpasswordController.text !=
                                _passwordController.text) {
                              return 'please enter currect password';
                            }
                            return null;
                          },
                            ),
                          ),
                        ],
                      ),
                    ),
                   
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final userName = _usernameController.text;
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            saveSignupDetails(userName, email, password);

                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Register'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 155),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginPage()));
                                },
                                child: Text('Login here'))
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
