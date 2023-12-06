import 'package:flutter/material.dart';
import 'package:pro_man/HomePage/homePage.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
 Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>  const HomePage(), 
        ),
      );
    });

    return Scaffold(
      //||====================BODY==================||
      body: Center(
         child: SizedBox(height: 200,width: 420,
         child: Image.asset
         ('assets/Screenshot 2023-10-12 151615.png'),),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}