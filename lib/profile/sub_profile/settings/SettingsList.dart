// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/profile/sub_profile/settings/sub_settings/AppInfo.dart';
import 'package:pro_man/profile/sub_profile/settings/sub_settings/help.dart';
import 'package:pro_man/profile/sub_profile/settings/sub_settings/t&c.dart';


class SettingsList extends StatefulWidget {
  const SettingsList({super.key});

  @override
  State<SettingsList> createState() => _SettingsList();
}

class _SettingsList extends State<SettingsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          // ListTile(
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute
          //     (builder:(_)=>Security() ));
          //   },
          //   leading: Icon(
          //     Icons.lock,
          //     color: blue,
          //   ),
          //   title: Text(
          //     'Security',
          //   ),
          // ),
          // SizedBox(height: 10,),
          ListTile(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute
              (builder:(_)=>Help() ));
            },
            leading: Icon(Icons.help, color: blue),
            title: Text('Help'),
          ),
          SizedBox(height: 10,),
          ListTile(
            onTap: () {
             Navigator.push(
                  context, MaterialPageRoute
              (builder:(_)=>AppInfo() ));
            },
            leading: Icon(Icons.info, color: blue),
            title: Text('App info'),
          ),
          SizedBox(height: 10,),
          ListTile(
            onTap: () {
             Navigator.push(
                  context, MaterialPageRoute
              (builder:(_)=>TermsandConditions() ));
            },
            leading: Icon(Icons.edit_document, color: blue),
            title: Text('Terms & Conditions'),
            
          ),
          SizedBox(height: 10,),
          ListTile(
            onTap: () {
              //=================================logout====================================================\\
            },
            leading: Icon(Icons.lock, color: Color.fromARGB(255, 21, 122, 204)),
            title: Text('privacy policy'),
          ),
        ]),
      ),
    );
  }
}
