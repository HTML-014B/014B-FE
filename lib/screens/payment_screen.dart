import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/screens/home_screen.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create the view scaffold. Use a list view so things scroll.
    return Scaffold(
        appBar: CustomAppBar(title: ''),
        body: Center(
            child: Column(
          children: [
            SizedBox(height: 240),
            IconButton(
                onPressed: () => {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home',
                        (Route<dynamic> route) =>
                            route.settings.name == '/home',
                      )
                    },
                icon: Icon(Icons.home)),
            Text(
              '결제시스템 준비중입니다',
              style: TextStyle(
                fontSize: 20.0, // 폰트 크기를 24로 설정
              ),
            ),
          ],
        )));
  }
}
