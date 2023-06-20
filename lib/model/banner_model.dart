class BannerModel {
  late String url;
  late int type;

  BannerModel({required this.url, required this.type});

  BannerModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}
