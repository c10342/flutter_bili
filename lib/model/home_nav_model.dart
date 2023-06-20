class HomeNavModel {
  late String name;
  late int value;

  HomeNavModel({required this.name, required this.value});

  HomeNavModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
