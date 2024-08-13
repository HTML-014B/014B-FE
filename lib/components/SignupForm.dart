import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:html_front/models/auth_model.dart';
import 'package:http/http.dart' as http;

class SignupForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _serial_id = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField("아이디"),
            SizedBox(height: 20),
            CustomTextFormField("비밀번호"),
            SizedBox(height: 30),
            submitButton(context),
          ],
        ));
  }

  // input
  Widget CustomTextFormField(text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(height: 5.0),
        Container(
            width: 350,
            child: TextFormField(
                validator: (value) => value!.isEmpty ? "${text}를 입력해주세요" : null,
                obscureText: text == "비밀번호" ? true : false,
                decoration: InputDecoration(
                  //hintText: "$text 입력",
                  filled: true,
                  fillColor: Color(0xffEDEDED),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSaved: (value) =>
                    {text == '아이디' ? _serial_id = value! : _password = value!}))
      ],
    );
  }

  // 폼 제출 버튼 위젯
  Widget submitButton(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50, // 버튼의 너비 설정
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // 모서리를 둥글게 설정
          ),
          backgroundColor: Color(0xffDFF797),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Text(
            "회원가입",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            Navigator.pushNamed(context, '/login');

            final response = await http.post(
              Uri.parse('http://10.0.2.2:3000/v1/auth/signup'),
              body: {"serial_id": _serial_id, "password": _password},
            );
            if (response.statusCode == 200) {
              // 전역 상태 관리 set
              //_userProvider.name = user.name;
              //_userProvider.email = user.email;
              //_userProvider.route = user.route;
              //_userProvider.user_id = user.user_id;
              Navigator.pushReplacementNamed(context, '/login');
              // Navigator.pushReplacementNamed(context, '/home', arguments: {
              //   "user_id": user.user_id
              // }); // 홈 화면 갈 때 email, image route 보내야함
            }
          }
        },
      ),
    );
  }
}
