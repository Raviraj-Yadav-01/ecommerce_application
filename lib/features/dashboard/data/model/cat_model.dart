class CatModel {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  CatModel({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  CatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}