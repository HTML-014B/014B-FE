import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Solution extends StatelessWidget {
  late String solution;
  String user = '공일오비';
  Solution({required this.solution});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/background.png'),
      SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/character2.png',
          width: 50,
          height: 50,
        ),
        SizedBox(width: 10),
        Text('$user 님을 위한 식집사의 솔루션')
      ]),
      SizedBox(height: 20),
      Expanded(
          child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: Color(0xffF7ECB4).withOpacity(0.24)),
        child: SingleChildScrollView(
            child: Text(
          '$solution',
          style: TextStyle(fontSize: 20),
        )),
      ))
    ]);
  }
}
