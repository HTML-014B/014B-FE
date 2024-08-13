import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_front/components/SignupForm.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: [
              SizedBox(height: 70.0),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/character2.png',
                      width: 60,
                      height: 60,
                    ),
                    Text('회원가입',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Image.asset(
                      'assets/character2.png',
                      width: 60,
                      height: 60,
                    ),
                  ]),

              /* Image.asset(
                'assets/final_logo.png',
                width: 180,
                height: 180,
              )*/
              SizedBox(height: 40),
              SignupForm(),
            ])));
  }
}
