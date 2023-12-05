// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pro_man/HomePage/homePage.dart';
import 'package:pro_man/databace/database.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/signUp&login/signUp.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: Form(
                key: _formKeyy,
                child: Column(
                  children: [
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
                    Text('Login to your account',
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    SizedBox(
                      height: 35,
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
                    Padding(
                        padding: EdgeInsets.only(left: 250),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: blue),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 360,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKeyy.currentState!.validate()) {
                            final email = _emailController.text;
                            final password = _passwordController.text;

                            final signupBox =
                                await Hive.openBox<UserModel>('users');
                            final signupDetails = signupBox.get('users',
                                defaultValue: UserModel(
                                    username: '', email: '', password: ''));

                            if (signupDetails != null &&
                                signupDetails.email == email &&
                                signupDetails.password == password) {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Invalid email or password'),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 290),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => signUpPage()));
                                },
                                child: Text('Sign Up'))
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
