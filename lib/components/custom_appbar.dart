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
            'assets/logo.png',
            height: 30,
            width: 30,
          ),
          Text(title,
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
        ]));
  }

  // appbar 사이즈 조절
  @override
  Size get preferredSize => Size.fromHeight(50);
}
