class UserModel {
  late String userName;
  late String id;

  UserModel({required this.userName, required this.id});

  UserModel.fromToJson(Map<String, dynamic> json) {
    userName = json['userName'] ?? '';
    id = json['id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userName'] = userName;
    data['id'] = id;
    return data;
  }
}
