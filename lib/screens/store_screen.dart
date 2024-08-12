import 'package:flutter/material.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/components/product_item.dart';
import 'package:html_front/models/product.dart';

class StoreScreen extends StatefulWidget {
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ProductItem(product: productList[index]);
            },
            separatorBuilder: (context, index) => const Divider(
                color: Color(0xffDFDFDF), height: 0, indent: 16, endIndent: 1),
            itemCount: productList.length));
  }
}
