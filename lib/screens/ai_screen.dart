import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/components/solution.dart';
import 'package:http/http.dart' as http;

class SolutionModel {
  final String answer;

  SolutionModel.fromJson(Map<String, dynamic> json) : answer = json['answer'];
}

class AiScreen extends StatefulWidget {
  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  //late String solution;

  String description = '';
  String solution = "";
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

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    dynamic body = {"request": description};
    body = jsonEncode(body);
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/v1/question/request'),
        headers: {"Content-Type": "application/json"},
        body: body);
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // UTF-8로 디코딩된 문자열 추출
        String answer = utf8.decode(jsonResponse['answer'].runes.toList());
        print(answer); // 올바르게 디코딩된 문자열 출력
        solution = answer;
        isLoading = false;
        isCompleted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'CIFARM'),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: isCompleted == false && isLoading == false
                ? SingleChildScrollView(
                    child: Column(
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
                          maxLines: 8,
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
                        SizedBox(height: 40),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(500, 50),
                                backgroundColor: Color(0xffDFF797)),
                            onPressed: () async {
                              await fetchData();
                            },
                            child: Text('확인')),
                      ]))
                : isLoading == true && isCompleted == false
                    ? Center(
                        child: SingleChildScrollView(
                            child: Column(
                        children: [
                          Image.asset('assets/final_loading.gif',
                              width: 1000, height: 400),
                          Text('적합한 작물과 소개서를 작성중이에요...',
                              style: TextStyle(
                                fontSize: 18.0, // 글꼴 크기를 24.0으로 설정
                                color: Colors.black, // 텍스트 색상 설정 (선택 사항)
                              ))
                        ],
                      )))
                    : Solution(solution: solution)));
  }
}
