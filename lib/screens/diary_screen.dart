import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_front/components/crop_item.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/models/crop_model.dart';

class DiaryScreen extends StatefulWidget {
  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<CropModel> cropsList = cropList;
  final String user = '공일오비';
  final String author = '쿠톤농장';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onClickTotal() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'CIFARM'),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          'assets/background2.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              //농장이름
                              '$user 님의',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Container(
                              color: Color(0xffF8F9AB).withOpacity(0.5),
                              child: Text(
                                //주소
                                '$author',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              //소개글
                              '운영 30일차',
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Row(children: [
                              SizedBox(width: 30),
                              Image.asset(
                                'assets/sun.png',
                                width: 30,
                                height: 30,
                              ),
                              Text(
                                '햇빛이 잘 들어와요',
                              ),
                            ]),
                            Row(children: [
                              SizedBox(width: 30),
                              Image.asset('assets/wind.png',
                                  width: 30, height: 30),
                              Text('바람이 잘 통해요'),
                            ]),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: onClickTotal,
                          child: Text(
                            //소개글
                            '전체 선택',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff939191)),
                          ),
                        )
                      ],
                    ),
                    Divider(color: Color(0xffD9D9D9)),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CropItem(crop: cropsList![index]);
                        },
                        separatorBuilder: (context, index) => const Divider(
                          color: Color(0xffDFDFDF),
                          height: 0,
                          indent: 16,
                          endIndent: 1,
                        ),
                        itemCount: cropsList!.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffDFF797),
                                  ),
                                  onPressed: () {},
                                  child: Text('식물 등록하기'))),
                          SizedBox(width: 10),
                          SizedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffDFF797),
                                  ),
                                  onPressed: () {},
                                  child: Text('식물 관리하기')))
                        ],
                      )

                      /* ListView.separated(
                        itemBuilder: (context, index) {
                          return CropItem(crop: cropsList[index]);
                        },
                        separatorBuilder: (context, index) => const Divider(
                            color: Color(0xffDFDFDF),
                            height: 0,
                            indent: 16,
                            endIndent: 1),
                        itemCount: cropsList.length),*/
                      ,
                      //SizedBox(height: 30)

                      /*  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(width: 100, child: Text('아아'));
            })*/
                    )
                  ],
                ))));
  }
}
