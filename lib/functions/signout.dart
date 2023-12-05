  import 'package:flutter/material.dart';
import 'package:pro_man/signUp&login/LogIn.dart';

void showSignOutDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("sign out"),
          content: const Text('are you sure you want to signout?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('no')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                  
                },
                child: const Text('yes'))
          ],
        );
      },
    );
  }

