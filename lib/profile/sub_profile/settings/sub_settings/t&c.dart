// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pro_man/functions/background.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('Terms & Condition')),
      ),
      body: CustomBackground(
        child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 163),
                        child: const Text(
                          'Terms and Conditions',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("These terms and conditions ('Terms') govern your use of the 'PRO-MAN' app (the 'App'), created by Procode. By accessing or using the App, you agree to comply with and be bound by these Terms. If you do not agree with these Terms, please do not use the App.", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
                // SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 146),
                        child: const Text(
                          '1. Acceptance of Terms',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("By using the 'PRO-MAN' App, you acknowledge that you have read, understood, and agreed to these Terms. These Terms may be updated or modified by Procode from time to time. Your continued use of the App constitutes your acceptance of any changes.",
                       style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
               Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 199),
                        child: const Text(
                          '2. User Accounts',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("1)You may be required to create a user account to access certain features of the App.\n2) You are responsible for maintaining the confidentiality of your account credentials.\n3) You agree to provide accurate and complete information when creating your account.\n4) You must promptly notify us of any unauthorized use or security breach of your account.", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
                Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 255),
                        child: const Text(
                          '3. Privacy',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text(" 1) Your use of the App is also governed by our Privacy Policy, which is incorporated by reference.", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
                Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 149),
                        child: const Text(
                          '4. User Responsibilities',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("1) You agree to use the App for lawful purposes and in compliance with all applicable laws and regulations. \n2) You are responsible for the tasks and data you input into the App. \n3) You may not use the App for any illegal or harmful activities.", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
                Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 230),
                        child: const Text(
                          '5. Ownership',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("1)The 'PRO-MAN' App and all its content, features, and functionality are owned by Procode and are protected by applicable copyright, trademark, and other intellectual property laws", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
                Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 139),
                        child: const Text(
                          '6. Limitations of Liability',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("1)Procode disclaims any liability for the accuracy, reliability, availability, or performance of the App.\n2)We are not responsible for any loss or damage to your data.", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
                Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 225),
                        child: const Text(
                          '7. Termination',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("1)Procode may terminate your access to the App at any time, with or without cause, and with or without notice.", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
                Padding(
                  padding: EdgeInsets.only(top: 66, left: 30,right: 30,),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 154),
                        child: const Text(
                          '8. Contact Information',
                          style: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      
                      Text("1)If you have any questions or concerns regarding these Terms, please contact us at procode@gmail.com.", style: TextStyle(
                              fontSize: 17, 
                              ),)
                    ],
                  ),
                  
                ),
            ],
          ),
        ),
        ),
    );
  }
}