import 'package:flutter/material.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/components/green_score.dart';
import 'package:html_front/screens/home_screen.dart';
import 'package:html_front/screens/managePlants_screen.dart';
import 'package:html_front/screens/myApplication_screen.dart';
import 'package:html_front/screens/mySaleList_screen.dart';

class MyPageScreen extends StatefulWidget {
  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(height: 30),
      Container(
          padding: const EdgeInsets.all(10),
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xffE6F7B4),
          ),
          child: Center(
              child: Row(
            children: [
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                width: 120,
                height: 120,
                child: Image.asset(
                  'assets/loadingCharacter.png',
                  width: 120,
                  height: 120,
                ),
              ),
              /*SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/character.png',
                    ),
                  ),
                ),*/
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('공일오비님',
                      style: TextStyle(fontSize: 28),
                      textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  Text(
                    '초보 도시농부',
                    style: TextStyle(fontSize: 16, color: Color(0xff074B0E)),
                  ),
                  Text(
                    '농장 운영 10일차 ',
                    style: TextStyle(fontSize: 16, color: Color(0xff074B0E)),
                  ),
                ],
              ))
            ],
          ))),
      Column(
        children: [
          SizedBox(height: 8),
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    SizedBox(width: 10),
                    Text('나의 텃밭',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600))
                  ])
                ],
              )),
          new Divider(color: Color(0xffD9D9D9), thickness: 3),
          new ListTile(
            title: new Text('텃밭 신청 현황'),
            leading: Image.asset(
              'assets/checked.png',
              width: 30,
              height: 30,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApplicationScreen()));
            },
          ),
          new Divider(
            color: Color(0xffD9D9D9),
          ),
          new ListTile(
            title: new Text('판매 내역'),
            leading: Image.asset(
              'assets/cartoonTomato.png',
              width: 30,
              height: 30,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MySaleListScreen()));
            },
          ),
          new Divider(color: Color(0xffD9D9D9)),
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(children: [
                    SizedBox(width: 10),
                    Text('나의 녹색 지수',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600))
                  ])
                ],
              )),
          new Divider(color: Color(0xffD9D9D9), thickness: 3),
          GreenScore()
          /*  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(width: 100, child: Text('아아'));
            })*/
        ],
      )
    ])));
  }
}
