import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xffFFFFFF),
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/appbar_logo.png',
            height: 40,
            width: 40,
          ),
          SizedBox(width: 5),
          Image.asset(
            'assets/FARMIN.png',
            height: 100,
            width: 100,
          ),
        ]));
  }

  // appbar 사이즈 조절
  @override
  Size get preferredSize => Size.fromHeight(50);
}
