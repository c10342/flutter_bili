class CourseModel {
  late String title;
  String? url;
  int? courseNo;

  CourseModel({required this.title, this.url, this.courseNo});

  CourseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    courseNo = json['courseNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['url'] = url;
    data['courseNo'] = courseNo;
    return data;
  }
}
