import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_front/components/crop_item.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/models/crop_model.dart';

class ManageMyCropsScreen extends StatefulWidget {
  @override
  State<ManageMyCropsScreen> createState() => _ManageMyCropsScreenState();
}

class _ManageMyCropsScreenState extends State<ManageMyCropsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final String cropName = "방토";
  final String cropKind = "방울토마토";
  final int sunCount = 3;
  final int waterCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'CIFARM'),
        body: SingleChildScrollView(
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
                        Text('농장 식물 관리하기',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 20.0, // 글꼴 크기를 24.0으로 설정
                              color: Color(0xff6B614D), // 텍스트 색상 설정 (선택 사항)
                            )),
                        IconButton(
                            onPressed: () => {},
                            icon: Icon(CupertinoIcons.pencil)),
                      ],
                    ),
                    Divider(
                      thickness: 3.0,
                      color: Color(0xffD9D9D9),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/realTomato.png', // 이미지 파일 경로
                          width: 180, // 이미지의 너비
                          height: 180, // 이미지의 높이
                          fit: BoxFit.cover, // 이미지가 박스에 맞게 조절됨
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      height: 40, // 타원의 높이
                      decoration: BoxDecoration(
                        color: Color(0xffD5C2A5).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text('$cropKind'),
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color(0xffE6F7B4),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Text('$cropKind가 목이 말라요~~'),
                            SizedBox(height: 10),
                            Divider(
                              thickness: 10.0,
                              color: Color(0xffD9D9D9),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('물주기'),
                                    Text('추천비료'),
                                    Text('처음 심은 날')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('주 2~3회'),
                                    Text('완효성 비료'),
                                    Text('2024.08.01')
                                  ],
                                )
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 20),
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color(0xffFDF7EA),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Text('우리 $cropName는요 ...'),
                            Divider(
                              thickness: 1.0,
                              color: Color(0xffD9D9D9),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 50,
                                        child: Text('햇빛'),
                                      ),
                                    ),
                                    Row(
                                      children:
                                          List.generate(sunCount, (index) {
                                        return Image.asset(
                                          'assets/sun.png', // 이미지 파일 경로
                                          height: 30, // 이미지 높이
                                          width: 30, // 이미지 너비
                                        );
                                      }),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 50,
                                        child: Text('물'),
                                      ),
                                    ),
                                    //Text('물'),
                                    Row(
                                      children:
                                          List.generate(waterCount, (index) {
                                        return Image.asset(
                                          'assets/drop.png', // 이미지 파일 경로
                                          height: 22, // 이미지 높이
                                          width: 22, // 이미지 너비
                                        );
                                      }),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ))));
  }
}
