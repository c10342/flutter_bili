class VideoItemModel {
  late String url;
  late int viewCount;
  late int likeCount;
  late int totalTime;
  late String title;
  late String avatar;
  late String userName;

  VideoItemModel(
      {required this.url,
      required this.viewCount,
      required this.likeCount,
      required this.totalTime,
      required this.title,
      required this.avatar,
      required this.userName});

  VideoItemModel.fromJson(Map<String, dynamic> json) {
    url = json['url'] ?? '';
    viewCount = json['viewCount'] ?? 0;
    likeCount = json['likeCount'] ?? 0;
    totalTime = json['totalTime'] ?? 0;
    title = json['title'] ?? '';
    avatar = json['avatar'] ?? '';
    userName = json['userName'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url'] = url;
    data['viewCount'] = viewCount;
    data['likeCount'] = likeCount;
    data['totalTime'] = totalTime;
    data['title'] = title;
    data['avatar'] = avatar;
    data['userName'] = userName;
    return data;
  }
}
