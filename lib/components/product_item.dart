import 'package:flutter/cupertino.dart';
import 'package:html_front/components/product_detail.dart';
import 'package:html_front/models/product.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              product.image,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          ProductDetail(product: product)
        ],
      ),
    );
  }
}
