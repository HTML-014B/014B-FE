import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_front/models/crop_model.dart';


class CropItem extends StatefulWidget {
  final CropModel crop;
  const CropItem({required this.crop});

  @override
  State<CropItem> createState() => _CropItemState();
}

class _CropItemState extends State<CropItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(widget.crop!.img, width: 100, height: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.crop!.name,
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                    color: Color(0xffF5F5F5),
                    child: Text('D+${widget.crop!.id}'))
              ],
            ),
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              value: widget.crop.status,
              onChanged: (val) {
                setState(() {
                  widget.crop.status = val!;
                });
              },
            )
          ],
        ));
  }
}
