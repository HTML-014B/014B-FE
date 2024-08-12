import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:html_front/models/plant_model.dart';
import 'package:html_front/screens/ai_screen.dart';
import 'package:html_front/screens/diary_screen.dart';

class ManagePlantsScreen extends StatefulWidget {
  @override
  State<ManagePlantsScreen> createState() => _ManagePlantsScreenState();
}

class _ManagePlantsScreenState extends State<ManagePlantsScreen> {
  List<PlantModel> _plantList = plantList;
  List<String> selectedIndex = [];
  int total_price = 0;
  String user = '공일오비';
  String title = '도시농장';
  bool isClicked = false;
  int section = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isClicked = false; // 확정하기가 눌렸는지?
    section = 0;
  }

  void addPlant(int index, int price) {
    setState(() {
      _plantList[index].status = 'selected';
      if (isClicked == false && section >= 0) section += 1;
      total_price += price;
    });
  }

  void removePlant(int index, int price) {
    setState(() {
      _plantList[index].status = 'normal';
      if (isClicked == false && section > 0) section -= 1;
      total_price -= price;
    });
  }

  void myPlant(List<PlantModel> plant) {
    setState(() {
      for (PlantModel pl in plant) {
        if (pl.status == 'selected') pl.status = 'me';
      }
    });
  }

  void clickPayment() {
    setState(() {
      isClicked = true;
      section = 0;
      total_price = 0;
    });
  }

  void prohibitPlants() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
            backgroundColor: Color(0xFFFFFFFF),
            title: Center(
                child: Row(
              children: [
                SizedBox(width: 10),
                Text('${user}님의 도시농장'),
                SizedBox(width: 10),
              ],
            ))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Expanded(
                child: (GridView.builder(
              shrinkWrap: true,
              itemCount: _plantList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 0, //수평 Padding
                crossAxisSpacing: 0, //수직 Padding
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      print(_plantList[index].status);
                      if (_plantList[index].status == 'prohibited') {
                        return;
                      }
                      if (_plantList[index].status == 'normal') {
                        //plants.addPlant(plants.plants[index], 1);
                        setState(() {
                          print(index);
                          addPlant(index, 1);
                        });

                        /*context
                              .read<Plants>()
                              .addPlant(plants.plants[index], 1);*/
                        //plants.plants[index].status == 'selected';
                        //print(plants.plants[index].id);
                        return;
                      }
                      if (_plantList[index].status == 'selected') {
                        //plants.removePlant(plants.plants[index], 1);

                        setState(() {
                          print(index);
                          removePlant(index, 1);
                        });
                      }

                      // context
                      //     .read<Plants>()
                      //     .removePlant(plants.plants[index], 1);
                      //plants.plants[index].status == 'normal';
                      //print(plants.plants[index].id);
                    },
                    child: Container(
                        child: _plantList[index].status == 'normal'
                            ? Image.asset('assets/ground_nothing.png')
                            : _plantList[index].status == 'selected'
                                ? Image.asset('assets/ground_clicked.png')
                                : _plantList[index].status == 'prohibited'
                                    ? Image.asset(
                                        'assets/ground_prohibited.png')
                                    : _plantList[index].status == 'me'
                                        ? Image.asset(
                                            'assets/my_ground_nothing.png')
                                        : Image.asset(
                                            'assets/my_ground_carrot.png')));
              },
            ))),
            total_price > 0
                ? AnimatedContainer(
                    //padding: const EdgeInsets.all(2),
                    duration: Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    height: 80,
                    decoration: BoxDecoration(color: Color(0xffE6F7B4)),
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          '선택 면적 $section평',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () => {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        //clickPayment();
                                        return AlertDialog(
                                            title: Text('확정하기'),
                                            content: Text(
                                                '결제하실 금액은 ${total_price * 100000}원 입니다'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(false);
                                                  },
                                                  child: Text('취소')),
                                              TextButton(
                                                onPressed: () {
                                                  clickPayment();
                                                  setState(() {
                                                    isClicked = false;
                                                    section = 0;
                                                    total_price = 0;
                                                    myPlant(_plantList);
                                                    Navigator.of(context)
                                                        .pop(false);
                                                  });
                                                },
                                                child: Text('결제하기'),
                                              ),
                                            ]);
                                      })
                                },
                            child: Container(
                                child: isClicked == false
                                    ? Text('${total_price * 100000}원 확정하기')
                                    : Text(''
                                        //'확정완료!',
                                        /* textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),*/
                                        )))
                      ],
                    )),
                  )
                : SizedBox(height: 0)
          ],
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.white,
          child: Image.asset('assets/watering.png', width: 50, height: 50),
          children: [
            SpeedDialChild(
                child: Image.asset('assets/fork.png', width: 30, height: 30),
                label: "내 농장일지",
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DiaryScreen()))),
            SpeedDialChild(
                child: Image.asset('assets/natural.png', width: 30, height: 30),
                label: "식집사 AI와 Q&A",
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AiScreen()))),
            SpeedDialChild(
                child: Image.asset('assets/cartoonTomato.png',
                    width: 30, height: 30),
                label: "농작물 판매",
                onTap: () => print("판매준비중"))
          ],
        )

        //   Colors.transparent,
        //   focusElevation: 0,
        //   hoverElevation: 0,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        //   highlightElevation: 0,
        //   child: Image.asset('assets/floating.png'),
        //   onPressed: () {
        //     // Do something
        //   },
        // )
        );
  }
}

//context.watch<Plants>().plants[index].status
