import 'package:flutter/cupertino.dart';
import 'package:html_front/components/farm_detail.dart';
import 'package:html_front/models/farm_model.dart';

class FarmItem extends StatelessWidget {
  final FarmModel farm;
  FarmItem({required this.farm});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              farm.image,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          FarmDetail(farm: farm)
        ],
      ),
    );
  }
}
