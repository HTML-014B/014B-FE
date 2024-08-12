import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_front/models/farm_model.dart';

class DetailScreen extends StatefulWidget {
  FarmModel farm;

  DetailScreen({required this.farm});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isCompleted = false;

  List<String> viewImages = [
    'assets/view1',
    'assets/view2',
    'assets/view3',
    'assets/view4'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCompleted = false;
  }

  void onPressed() {
    setState(() {
      isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset(
                      '${widget.farm.image}',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          //농장이름
                          '${widget.farm.author}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Text(
                          //주소
                          '${widget.farm.address}',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Text(
                          //소개글
                          '농장소개글',
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff939191)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF7ECB4).withOpacity(0.24)),
                          child: Text(
                            //소개글
                            '${widget.farm.description}',
                            style: TextStyle(fontSize: 8),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Color(0xffD9D9D9)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      //소개글
                      '농장 상세정보',
                      style: TextStyle(fontSize: 15, color: Color(0xff939191)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(color: Color(0xffF7ECB4).withOpacity(0.24)),
                  child: Text(
                    // 상세정보
                    '${widget.farm.details}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Divider(color: Color(0xffD9D9D9)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      //소개글
                      '농장 상세정보',
                      style: TextStyle(fontSize: 15, color: Color(0xff939191)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/view1.jpg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Image.asset(
                          'assets/view2.jpg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Image.asset(
                          'assets/view3.jpg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Image.asset(
                          'assets/view4.jpg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                      style: isCompleted != true
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffDFF797),
                            )
                          : ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE2E2E2),
                            ),
                      onPressed: onPressed,
                      child: isCompleted != true
                          ? Text('텃밭 신청하기')
                          : Text('신청 완료')),
                )

                /*  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(width: 100, child: Text('아아'));
            })*/
              ],
            )));
  }
}
