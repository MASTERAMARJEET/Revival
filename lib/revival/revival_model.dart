class RevivalDetail {
  List<String>? about;
  String? fb;
  String? insta;
  String? schedule;
  String? faq;

  RevivalDetail({
    this.about,
    this.fb,
    this.insta,
    this.schedule,
    this.faq,
  });

  factory RevivalDetail.fromJson(Map<String, dynamic> json) {
    return RevivalDetail(
        about: json['about'].cast<String>(),
        fb: json['facebook'],
        insta: json['insta'],
        schedule: json['schedule'],
        faq: json['faq']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['about'] = this.about;
    data['facebook'] = this.fb;
    data['insta'] = this.insta;
    data['schedule'] = this.schedule;
    data['faq'] = this.faq;
    return data;
  }
}
