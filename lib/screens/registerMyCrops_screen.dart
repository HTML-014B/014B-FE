import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/screens/manageMyCrops_screen.dart';
import 'package:image_picker/image_picker.dart';

class RegisterMyCropsScreen extends StatefulWidget {
  @override
  State<RegisterMyCropsScreen> createState() => _RegisterMyCropsScreenState();
}

class _RegisterMyCropsScreenState extends State<RegisterMyCropsScreen> {
  final registerCropFormKey = GlobalKey<FormState>();

  String _cropName = '';
  String _imagePath = '';
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
      //가져온 이미지를 _image에 저장
    }
    ;
  }

  Widget buildPhotoArea() {
    return _image != null
        ? Container(
            width: 250,
            height: 250,
            child: Image.file(File(_image!.path),
                fit: BoxFit.cover), //가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            width: 250,
            height: 250,
            color: Colors.grey,
          );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget submitButton(BuildContext context) {
    /*Future<dynamic> patchUserProfileImage(dynamic input) async {
      var dio = new Dio();
      try {
        dio.options.contentType = 'multipart/form-data';
        dio.options.maxRedirects.isFinite;
        var response = await dio.post('http://10.0.2.2:3000/study/postBanner',
            data: input);
        print('성공적으로 업로드했습니다');
        return response.data;
      } catch (e) {
        print(e);
      }
    }*/

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xffE6F7B4)),
      onPressed: () async {
        /*if (registerCropFormKey.currentState!.validate()) {
          registerCropFormKey.currentState!.save();
          dynamic body = {
            "leader_id": _UserProvider.user_id,
            "title": _title,
            "description": _description,
          };
          body = jsonEncode(body);

          // 생성
          final response = await http.post(
              Uri.parse('http://10.0.2.2:3000/study/addStudies'),
              headers: {"Content-Type": "application/json"},
              body: body);
          if (response.statusCode == 200) {
            // 서버에 이미지 업로드

            if (_banner != "") {
              var formData = FormData.fromMap({
                'image': await MultipartFile.fromFile(_banner),
                'invite_code': response.body
              });
              print(response.body);
              patchUserProfileImage(formData);
            }
*/
        showDialog(
            context: context,
            builder: (_) {
              //clickPayment();
              return AlertDialog(
                  title: Text('등록완료!'),
                  content: Text('$_cropName 작물이 생성 되었습니다!'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageMyCropsScreen(),
                                      fullscreenDialog: true))
                              .then((value) => setState(() {}));
                        },
                        child: Text('확인')),
                  ]);
            });
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        child: const Text(
          "등록",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

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
                        Text('농장 식물 등록하기',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 20.0, // 글꼴 크기를 24.0으로 설정
                              color: Color(0xff6B614D), // 텍스트 색상 설정 (선택 사항)
                            )),
                        IconButton(
                            onPressed: () {
                              getImage(ImageSource
                                  .gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
                            },
                            icon: Icon(CupertinoIcons.pencil)),
                      ],
                    ),
                    Divider(
                      thickness: 3.0,
                      color: Color(0xffD9D9D9),
                    ),
                    SingleChildScrollView(
                        child: Form(
                            key: registerCropFormKey,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    buildPhotoArea(),
                                    IconButton(
                                      icon: Icon(Icons.add_a_photo),
                                      onPressed: () {
                                        getImage(ImageSource
                                            .gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
                                      },
                                    ),
                                    TextFormField(
                                        decoration: InputDecoration(
                                          hintText: '작물 이름을 지어주세요',
                                        ),
                                        validator: (value) => value!.isEmpty
                                            ? "작물 이름을 지어주세요"
                                            : null,
                                        maxLines: 1,
                                        onSaved: (value) =>
                                            {_cropName = value!}),
                                    SizedBox(height: 40),
                                    submitButton(context),
                                    SizedBox(height: 40),
                                    Text(
                                      '실시간 인기 식물',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 20.0, // 글꼴 크기를 24.0으로 설정
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          color: Color(0xffE6F7B4)
                                              .withOpacity(0.28)),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset('assets/herb.png',
                                                  width: 100, height: 100),
                                              Text('허브-애플민트')
                                            ],
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            children: [
                                              Image.asset('assets/crop2.png',
                                                  width: 100, height: 100),
                                              Text('오이소박이 고추')
                                            ],
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            children: [
                                              Image.asset('assets/crop3.png',
                                                  width: 100, height: 100),
                                              Text('파프리카')
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ))))
                  ],
                ))));
  }
}
