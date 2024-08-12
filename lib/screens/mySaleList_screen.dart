import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySaleListScreen extends StatelessWidget {
  String user = '공일오비';
  String total_price = '12000';

  @override
  Widget build(BuildContext context) {
    // Create the view scaffold. Use a list view so things scroll.
    return Scaffold(
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(children: [
                    SizedBox(width: 10),
                    Image.asset('assets/cartoonTomato.png',
                        width: 30, height: 30),
                    SizedBox(width: 10),
                    Text('$user님의 판매 내역',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600))
                  ])
                ],
              )),
          new Divider(color: Color(0xffD9D9D9), thickness: 3),
          new ListTile(
            title: new Text('맛있는 햇감자 1kg $total_price원'),
            leading: Image.asset('assets/potato.png'),
            onTap: () {},
          ),
          new Divider(),
        ],
      ),
    );
  }
}
