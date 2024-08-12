class FarmModel {
  String author;
  String address;
  String image;
  String description;
  String details;

  FarmModel.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        author = json['author'],
        image = json['image'],
        description = json['description'],
        details = json['details'];
}

List<FarmModel> farmList = [
  FarmModel.fromJson({
    'address': '경기도 용인시 서천동 267-2',
    'author': '혜미농장',
    'image': 'assets/view1.jpg',
    'description': '서천동에 위치한 신설 농장입니다 관리하기 편리해요!',
    'details':
        '총 면적 84m² 12구획/ 1구획(7m²)\n모집 인원: 3/4\n모집 기간: 2024.05.01~2024.05.10\n대여 기간: 2024.06.01~2024.12.31\n편의시설: 물 공급소, 컨테이너, 화장실'
  }),
  FarmModel.fromJson({
    'address': '경기도 용인시 기흥구 서천동 400-29',
    'author': '다현농장',
    'image': 'assets/view2.jpg',
    'description': '고구마 토마토 감자를 기를 수 있어요 뷰가 좋아요',
    'details':
        '총 면적 58m² 12구획/ 2구획(3m²)\n모집 인원: 2/4\n모집 기간: 2024.05.01~2024.05.10\n대여 기간: 2024.08.01~2024.12.31\n편의시설: 물 공급소, 컨테이너'
  }),
];
