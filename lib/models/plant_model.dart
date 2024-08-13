class PlantModel {
  String id, status;

  // 회원정보
  PlantModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        status = json['status'];
}

List<PlantModel> plantList = [
  PlantModel.fromJson({'id': '0', 'status': 'normal'}),
  PlantModel.fromJson({'id': '1', 'status': 'normal'}),
  PlantModel.fromJson({'id': '2', 'status': 'normal'}),
  PlantModel.fromJson({'id': '3', 'status': 'normal'}),
  PlantModel.fromJson({'id': '5', 'status': 'normal'}),
  PlantModel.fromJson({'id': '6', 'status': 'prohibited'}),
  PlantModel.fromJson({'id': '7', 'status': 'prohibited'}),
  PlantModel.fromJson({'id': '8', 'status': 'normal'}),
  PlantModel.fromJson({'id': '10', 'status': 'prohibited'}),
  PlantModel.fromJson({'id': '11', 'status': 'normal'}),
  PlantModel.fromJson({'id': '11', 'status': 'prohibited'}),
  PlantModel.fromJson({'id': '11', 'status': 'prohibited'}),
  PlantModel.fromJson({'id': '11', 'status': 'prohibited'}),
  PlantModel.fromJson({'id': '11', 'status': 'prohibited'}),
  PlantModel.fromJson({'id': '11', 'status': 'prohibited'})
];
