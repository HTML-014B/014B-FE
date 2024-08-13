import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/models/plant_model.dart';
import 'package:html_front/screens/ai_screen.dart';
import 'package:html_front/screens/diary_screen.dart';
import 'package:html_front/screens/selectSchedule_screen.dart';

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
  bool isEditedMode = false;
  bool isClicked = false;
  int section = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEditedMode = false;
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

  /**누를 수 없는 땅 누를 시 다이얼로그 */
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Color(0xffFFFFF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.info, size: 50),
              SizedBox(height: 10),
              Text('이미 선점된 구역입니다.\n다른 구역을 선택해주세요'),
            ],
          ),
          actions: <Widget>[
            Center(
                child: TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: CustomAppBar(title: 'FARMIN'),
      body: Column(
        children: [
          SizedBox(height: 10),
          isEditedMode == false
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, // 간격을 띄우고 정렬
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '혜미 농장',
                            style: TextStyle(
                              fontSize: 24.0, // 글꼴 크기를 24.0으로 설정
                              color: Color(0xff6B614D), // 텍스트 색상 설정 (선택 사항)
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('경기도 용인시 서천동 267-2'),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Image.asset('assets/warning.png',
                                  width: 15, height: 15),
                              Text(
                                '총 6구역 남았어요!!',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xffFA0303)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Image.asset('assets/final_logo.png',
                          width: 120, height: 100),
                    ],
                  ))
              : Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () => setState(() {
                                    isEditedMode = false;
                                  }),
                              child: Text('<',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 30.0, // 글꼴 크기를 24.0으로 설정
                                    color:
                                        Color(0xff6B614D), // 텍스트 색상 설정 (선택 사항)
                                  ))),
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffD9D9D9)),
                                  onPressed: () => {},
                                  child: Text('구획별 가격',
                                      style: TextStyle(
                                        fontSize: 14.0, // 글꼴 크기를 24.0으로 설정
                                        color: Color(
                                            0xff000000), // 텍스트 색상 설정 (선택 사항)
                                      ))),
                              SizedBox(width: 10),
                              Image.asset('assets/reset.png',
                                  width: 25, height: 25),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 2.0), // 수평선 위아래 여백 설정
                        height: 1.0, // 수평선 높이
                        color: Color(0xffD9D9D9), // 수평선 색상
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 10),
          Expanded(
            // Expanded를 Column의 두 번째 자식으로 이동
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: _plantList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 0, //수평 Padding
                      crossAxisSpacing: 0, //수직 Padding
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (isEditedMode == false) {
                            // 구역 선택하기 버튼을 누르지 않고 클릭 시 효과x
                            return;
                          }
                          if (_plantList[index].status == 'prohibited') {
                            return _showCustomDialog(context);
                          }
                          if (_plantList[index].status == 'normal') {
                            setState(() {
                              addPlant(index, 1);
                            });
                            return;
                          }
                          if (_plantList[index].status == 'selected') {
                            setState(() {
                              removePlant(index, 1);
                            });
                          }
                        },
                        child: Container(
                          child: _plantList[index].status == 'normal'
                              ? Image.asset('assets/normalGrass.png')
                              : _plantList[index].status == 'selected'
                                  ? Image.asset('assets/selectedGrass.png')
                                  : Image.asset(
                                      'assets/prohibitedGrass_final.png'),
                        ),
                      );
                    },
                  ),
                ),
                if (total_price > 0)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      decoration: BoxDecoration(color: Color(0xffE6F7B4)),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/selectedGrass.png',
                                      width: 50, height: 50),
                                  SizedBox(width: 10),
                                  Text('총 면적 ${7 * section}')
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '총 $section 구역',
                                    style: TextStyle(
                                      fontSize: 18.0, // 폰트 크기를 24로 설정
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectScheduleScreen()),
                                          ),
                                      child: Text(
                                        "구역 대여하기",
                                        style: TextStyle(
                                          fontSize: 18.0, // 폰트 크기를 24로 설정
                                        ),
                                      ))
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (isEditedMode == false && total_price == 0)
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      // Center로 감싸 버튼을 가운데 정렬
                      child: SizedBox(
                        width: 350,
                        height: 50, // 버튼의 너비 설정
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(16), // 모서리를 둥글게 설정
                            ),
                            backgroundColor: Color(0xffDFF797),
                          ),
                          child: Text('구역 선택하기'),
                          onPressed: () => {
                            setState(() {
                              isEditedMode = true;
                            })
                          },
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
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
              MaterialPageRoute(builder: (context) => DiaryScreen()),
            ),
          ),
          SpeedDialChild(
            child: Image.asset('assets/natural.png', width: 30, height: 30),
            label: "식집사 AI와 Q&A",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AiScreen()),
            ),
          ),
          SpeedDialChild(
            child:
                Image.asset('assets/cartoonTomato.png', width: 30, height: 30),
            label: "농작물 판매",
            onTap: () => print("판매준비중"),
          ),
        ],
      ),
    );
  }
}

//context.watch<Plants>().plants[index].status
