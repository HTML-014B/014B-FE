class CropModel {
  String id, img, name;
  bool status;

  // 회원정보
  CropModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        status = json['status'],
        img = json['img'],
        name = json['name'];
}

List<CropModel> cropList = [
  CropModel.fromJson({
    'id': '1',
    'name': '토마토맛토',
    'status': false,
    'img': 'assets/realTomato.png'
  }),
  CropModel.fromJson({
    'id': '2',
    'name': '바니바니당근당근',
    'status': false,
    'img': 'assets/realCarrot.png'
  }),
  CropModel.fromJson({
    'id': '3',
    'name': '맛있는 고구마',
    'status': false,
    'img': 'assets/realCrop.png'
  })
];
