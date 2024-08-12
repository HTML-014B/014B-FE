import 'package:flutter/cupertino.dart';
import 'package:html_front/models/farm_model.dart';

class FarmDetail extends StatelessWidget {
  final FarmModel farm;

  const FarmDetail({required this.farm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(farm.author,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      SizedBox(height: 4.0),
      Text('${farm.address}'),
      SizedBox(height: 4.0),
      Text('${farm.description}',
          style: TextStyle(fontWeight: FontWeight.w500)),
    ]));
  }
}
