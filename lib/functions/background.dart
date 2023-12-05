// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pro_man/functions/color.dart';


class CustomBackground extends StatefulWidget {
  final Widget child;

  const CustomBackground({
    super.key,
    required this.child,
  });

  @override
  State<CustomBackground> createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          width: 450,
          color: blue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  height: 724,
                  width: 415,
                  child: widget.child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: blue,
      elevation: 0,
      toolbarHeight: 80,
      leading: Container(
        width: 10,
        decoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            // color: blue,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class BottomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); 
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20, 
      size.width,
      size.height - 50,
    ); 
    path.lineTo(size.width, 0); 
    path.close(); 
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
