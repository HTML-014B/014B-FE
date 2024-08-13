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
              Center(
                  child: Image.asset(
                'assets/final_logo.png',
                width: 180,
                height: 180,
              )),
              SignupForm(),
            ])));
  }
}
