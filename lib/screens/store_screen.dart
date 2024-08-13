import 'package:flutter/material.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/components/product_item.dart';
import 'package:html_front/models/product.dart';

class StoreScreen extends StatefulWidget {
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  bool isEliminated = false;
  bool isPopular = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEliminated = false;
    isPopular = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: ''),
        body: Column(children: [
          Row(children: [
            TextButton(
              onPressed: () {},
              child: Image.asset(
                'assets/align-justify.png', // 로컬 이미지 파일 경로
                width: 30, // 이미지 너비
                height: 30, // 이미지 높이
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(2), // 버튼 패딩 설정
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(30, 30),
                    backgroundColor: Color(0xffF5F5F5)),
                onPressed: () => {},
                child: Text('농기구')),
            TextButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(30, 30),
                    backgroundColor: Color(0xffF5F5F5)),
                onPressed: () => {},
                child: Text('채소')),
            TextButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(30, 30),
                    backgroundColor: Color(0xffF5F5F5)),
                onPressed: () => {},
                child: Text('씨앗')),
            SizedBox(width: 60),
            TextButton(
                style: TextButton.styleFrom(
                    minimumSize: Size(30, 30),
                    backgroundColor: Color(0xffF5F5F5)),
                onPressed: () => {},
                child: Text('인기농장순')),

            /*Transform.scale(
                scale: 0.8, // 체크박스 크기 조절
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  value: isEliminated,
                  onChanged: (val) {
                    setState(() {
                      isEliminated = val!;
                    });
                  },
                )),
            Text('인기농장순')*/
          ]),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ProductItem(product: productList[index]);
                  },
                  separatorBuilder: (context, index) => const Divider(
                      color: Color(0xffDFDFDF),
                      height: 0,
                      indent: 16,
                      endIndent: 1),
                  itemCount: productList.length))
        ]));
  }
}
