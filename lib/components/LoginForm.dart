import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
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
            SizedBox(height: 20),
            submitButton(context),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => {
                //Navigator.pushNamed(context, '/signup')
              },
              child: const Text('계정이 없으신가요? 가입하기'),
            )
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
                obscureText: text == "Password" ? true : false,
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
                    {text == 'email' ? _email = value! : _password = value!}))
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
            "로그인",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Navigator.pushNamed(context, '/home');
          }
        },
      ),
    );
  }
}
