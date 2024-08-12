import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/components/solution.dart';
import 'package:http/http.dart' as http;

class SolutionModel {
  final String solution;

  SolutionModel.fromJson(Map<String, dynamic> json)
      : solution = json['solution'];
}

class AiScreen extends StatefulWidget {
  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  //late String solution;

  String description = '';
  bool isLoading = false;
  bool isCompleted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    isCompleted = false;
  }

  void onChangeText(value) {
    setState(() {
      description = value;
    });
  }

  void onPressed() {
    // 로딩
    setState(() {
      isLoading = true;
      //CircularProgressIndicator();
      //var response = await http.post(
      //Uri.parse('http://127.0.0.1:8000/api/v1/models/completion'),
      //body: {'query': description});
      //solution = response.body;
      Timer.periodic(Duration(seconds: 5), (timer) {
        setState(() {
          isLoading = false;
          isCompleted = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'CIFARM'),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: isCompleted == false && isLoading == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Container(
                        child: Text(
                          '안녕하세요 식집사입니다! 👀 \n어떤 작물에 대해서 알아볼까요?',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Divider(color: Color(0xff34493A), thickness: 3),
                      SizedBox(height: 20),
                      Text('AI가 작물에 대해서 소개해줄게요!'),
                      SizedBox(height: 5),
                      TextFormField(
                        onChanged: (value) {
                          onChangeText(value);
                        },
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText:
                              '예시 문장) \n난 지금 포항에 살고 있고,\n토마토를 기르려고 해!\n텃밭에는 한 달에 1번 정도 방문할 수 있을 것 같아.',
                          filled: true,
                          fillColor: Color(0xffF7ECB4).withOpacity(0.24),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 500,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffDFF797),
                            ),
                            onPressed: onPressed,
                            child: Text('확인')),
                      )
                    ],
                  )
                : isLoading == true && isCompleted == false
                    ? Center(
                        child: Column(
                        children: [
                          Image.asset('assets/final_loading.gif',
                              width: 1000, height: 500),
                          Text('적합한 작물과 소개서를 작성중이에요...',
                              style: TextStyle(
                                fontSize: 18.0, // 글꼴 크기를 24.0으로 설정
                                color: Colors.black, // 텍스트 색상 설정 (선택 사항)
                              ))
                        ],
                      ))
                    : Solution(solution: '음음')));
  }
}
