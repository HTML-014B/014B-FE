class ProductModel {
  String title;
  String author;
  String image;
  String price;
  String star;

  ProductModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'],
        image = json['image'],
        price = json['price'],
        star = json['star'];
}

List<ProductModel> productList = [
  ProductModel.fromJson({
    'title': '영주대장간 명품호미 수제 농기구 원예도구',
    'author': '혜미농장',
    'image': 'assets/sale1.png',
    'price': '9,900',
    'star': '4.5'
  }),
  ProductModel.fromJson({
    'title': '미소산업 텃밭수확삽 로타리삽 농사 주말농장 밭같이',
    'author': '다현농장',
    'image': 'assets/sale2.png',
    'price': '45,000',
    'star': '4.7'
  }),
  ProductModel.fromJson({
    'title': '쪽파 종자 1kg / 쪽파씨앗 종구 국산',
    'author': '준혁농장',
    'image': 'assets/sale3.png',
    'price': '10,000',
    'star': '4.2'
  }),
];
