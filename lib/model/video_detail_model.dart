class VideoDetailModel {
  late String playUrl;
  late String avatar;
  late String userName;
  late int fansCount;
  late String title;
  late int viewCount;
  late int totalTime;
  late String remark;
  late int likeCount;
  late int like;
  late int unLike;
  late int rewardCount;
  late int collectCount;
  late int shareCount;

  VideoDetailModel(
      {required this.playUrl,
      required this.avatar,
      required this.userName,
      required this.fansCount,
      required this.title,
      required this.viewCount,
      required this.totalTime,
      required this.remark,
      required this.likeCount,
      required this.like,
      required this.unLike,
      required this.rewardCount,
      required this.collectCount,
      required this.shareCount});

  VideoDetailModel.fromJson(Map<String, dynamic> json) {
    playUrl = json['playUrl'] ?? '';
    avatar = json['avatar'] ?? '';
    userName = json['userName'] ?? '';
    fansCount = json['fansCount'] ?? 0;
    title = json['title'] ?? '';
    viewCount = json['viewCount'] ?? 0;
    totalTime = json['totalTime'] ?? 0;
    remark = json['remark'] ?? '';
    likeCount = json['likeCount'] ?? 0;
    like = json['like'] ?? 0;
    unLike = json['unLike'] ?? 0;
    rewardCount = json['rewardCount'] ?? 0;
    collectCount = json['collectCount'] ?? 0;
    shareCount = json['shareCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['playUrl'] = playUrl;
    data['avatar'] = avatar;
    data['userName'] = userName;
    data['fansCount'] = fansCount;
    data['title'] = title;
    data['viewCount'] = viewCount;
    data['totalTime'] = totalTime;
    data['remark'] = remark;
    data['likeCount'] = likeCount;
    data['like'] = like;
    data['unLike'] = unLike;
    data['rewardCount'] = rewardCount;
    data['collectCount'] = collectCount;
    data['shareCount'] = shareCount;
    return data;
  }
}
