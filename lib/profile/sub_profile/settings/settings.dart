// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pro_man/functions/background.dart';
import 'package:pro_man/profile/sub_profile/settings/SettingsList.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: Text('Settings')),
      ),
      body:CustomBackground(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 60,left: 30),
          child: SettingsList()),
      )
      
      )


      );
    
  }
}