import 'package:flutter/material.dart';
import 'package:html_front/components/LoginForm.dart';
import 'package:html_front/pages/login_page.dart';
import 'package:http/http.dart' as http;

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //late String isLogin = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE6F7B4),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash_1.png', width: 200, height: 60),
            Image.asset('assets/final_logo.png', width: 200, height: 200),
            Image.asset('assets/splash_FARMIN.png', width: 150, height: 50),
            SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // 모서리를 둥글게 설정
                  ),
                  backgroundColor: Color(0xffFDF7EA),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    "팜인 시작하기",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()))
                      .then((value) => setState(() {}));
                }),
          ],
        )));
  }
}
