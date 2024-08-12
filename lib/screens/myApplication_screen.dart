import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/models/farm_model.dart';
import 'package:html_front/screens/diary_screen.dart';


class MyApplicationScreen extends StatelessWidget {
  FarmModel farmsList = farmList[0];

  @override
  Widget build(BuildContext context) {
    // Create the view scaffold. Use a list view so things scroll.
    return Scaffold(
        appBar: CustomAppBar(title: 'CIFARM'),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(width: 10, height: 10),
                    Image.asset('assets/fork.png', width: 30, height: 30),
                    SizedBox(width: 10),
                    Text('텃밭 신청 현황',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600))
                  ])
                ],
              )),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset('assets/view1.jpg',
                          fit: BoxFit.cover, width: 115, height: 115),
                      SizedBox(width: 20),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(farmList[index].author,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 18)),
                            SizedBox(height: 4.0),
                            Text('${farmList[index].address}'),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xffDFF797),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          '승인 완료',
                                          style: TextStyle(fontSize: 10),
                                        ))),
                                SizedBox(width: 10),
                                SizedBox(
                                    width: 100,
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xffFFFFFF),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DiaryScreen()));
                                        },
                                        child: Text('내 농장 가기',
                                            style: TextStyle(fontSize: 10))))
                              ],
                            )
                          ])
                    ],
                  ));
            },
            separatorBuilder: (context, index) => const Divider(
              color: Color(0xffDFDFDF),
              height: 0,
              indent: 16,
              endIndent: 1,
            ),
            itemCount: 1,
          ))
        ]));
  }
}
