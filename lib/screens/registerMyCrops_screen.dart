import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_front/components/custom_appbar.dart';

class RegisterMyCropsScreen extends StatefulWidget {
  @override
  State<RegisterMyCropsScreen> createState() => _RegisterMyCropsScreenState();
}

class _RegisterMyCropsScreenState extends State<RegisterMyCropsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'CIFARM'),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('<',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 30.0, // 글꼴 크기를 24.0으로 설정
                                  color: Color(0xff6B614D), // 텍스트 색상 설정 (선택 사항)
                                ))),
                        Text('농장 식물 등록하기',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 20.0, // 글꼴 크기를 24.0으로 설정
                              color: Color(0xff6B614D), // 텍스트 색상 설정 (선택 사항)
                            )),
                      ],
                    ),
                    Divider(
                      thickness: 3.0,
                      color: Color(0xffD9D9D9),
                    ),
                  ],
                ))));
  }
}
