import 'package:flutter/cupertino.dart';

class GreenScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/greenScore.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text('5월 한 달간', style: TextStyle(fontSize: 18)),
                    Text('25점',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff8ED14A),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Image.asset('assets/co2.png', width: 30, height: 30),
                SizedBox(width: 20),
                Text('이산화탄소를 연간 10.4톤 흡수했어요',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
              ],
            ),
            Row(
              children: [
                Image.asset('assets/tree.png', width: 30, height: 30),
                SizedBox(width: 20),
                Text('나무 14그루를 심었어요',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/meter.png', width: 30, height: 30),
                SizedBox(width: 20),
                Text('지구 기온을 1도 낮췄어요',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
              ],
            )
          ],
        ));
  }
}
