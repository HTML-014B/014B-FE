import 'package:flutter/cupertino.dart';
import 'package:html_front/models/product.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(product.title,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      SizedBox(height: 4.0),
      Text('${product.author} ${product.star}'),
      SizedBox(height: 4.0),
      Text('개당 ${product.price}원',
          style: TextStyle(fontWeight: FontWeight.w500)),
    ]));
  }
}
