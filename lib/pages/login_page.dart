import 'package:flutter/material.dart';
import 'package:html_front/components/LoginForm.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String isLogin = '';
  //bool is_logined= false;

  // void checkIsLogined() async {
  //   final response =
  //       await http.get(Uri.parse('http://10.0.2.2:3000/auth/authCheck?email=${}'));
  //   var responseBody = jsonDecode(response.body) as Map<String, dynamic>;
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       isLogin = responseBody["isLogin"];
  //       _userProvider.name = responseBody["name"];
  //       _userProvider.email = responseBody["email"];
  //       _userProvider.route = responseBody["route"];
  //       _userProvider.user_id = responseBody["user_id"];
  //     });
  //   } else {
  //     setState(() {
  //       isLogin = 'false';
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkIsLogined();
    // if (isLogin == 'true') {
    //   Navigator.pushReplacementNamed(context, '/home');
    // }
  }

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
              SizedBox(height: 20.0),
              LoginForm()
            ])));
  }
}
