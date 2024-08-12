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
    'title': '갓 수확한 당근 한 박스',
    'author': '혜미농장',
    'image': 'assets/carrot.png',
    'price': '10,000',
    'star': '4.5'
  }),
  ProductModel.fromJson({
    'title': '갓 수확한 토마토 한 봉지',
    'author': '다현농장',
    'image': 'assets/tomato.png',
    'price': '5,000',
    'star': '4.7'
  }),
  ProductModel.fromJson({
    'title': '갓 수확한 감자 1kg 한 박스',
    'author': '준혁농장',
    'image': 'assets/potato.png',
    'price': '10,000',
    'star': '4.2'
  }),
];
