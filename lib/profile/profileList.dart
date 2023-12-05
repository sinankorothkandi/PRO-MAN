// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pro_man/functions/color.dart';
import 'package:pro_man/profile/sub_profile/privacyPolicy.dart';
import 'package:pro_man/profile/sub_profile/settings/sub_settings/AppInfo.dart';
import 'package:pro_man/profile/sub_profile/settings/sub_settings/help.dart';
import 'package:pro_man/profile/sub_profile/settings/sub_settings/t&c.dart';


class ProfileList extends StatefulWidget {
  const ProfileList({super.key});

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          // ListTile(
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => MyProfile()));
          //   },
          //   leading: Icon(
          //     Icons.person,
          //     color: blue,
          //   ),
          //   title: Text(
          //     'My Profile',
          //   ),
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => Statistic()));
          //   },
          //   leading: Icon(Icons.bar_chart_rounded, color: blue),
          //   title: Text('History'),
          // ),
             SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()));
            },
            leading: Icon(Icons.lock, color: blue),
            title: Text('privacy policy'),
          ),
          SizedBox(
            height: 15,
          ),
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
              (builder:(_)=> TermsandConditions() ));
            },
            leading: Icon(Icons.edit_document, color: blue),
            title: Text('Terms & Conditions'),
            
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // ListTile(
          //   onTap: () {
          //     showSignOutDialog(context);
          //   },
          //   leading:
          //       Icon(Icons.logout, color: Color.fromARGB(255, 21, 122, 204)),
          //   title: Text('Logout'),
          // ),
        ]),
      ),
    );
  }
}
