class EventDetail {
  String? name;
  String? insti;
  String? shortDesc;
  List<String>? about;
  List<String>? details;
  List<String>? prize;
  List<String>? judge;
  Rules? rules;
  List<String>? submission;
  List<String>? timeline;
  List<Contact>? contact;

  EventDetail(
      {required this.name,
      required this.insti,
      required this.shortDesc,
      this.about,
      this.details,
      this.prize,
      this.judge,
      this.rules,
      this.submission,
      this.timeline,
      this.contact});

  EventDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    insti = json['insti'];
    shortDesc = json['short_desc'];
    about = json['about'].cast<String>();
    details = json['details'].cast<String>();
    prize = json['prize'].cast<String>();
    judge = json['judge'].cast<String>();
    rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
    submission = json['submission'].cast<String>();
    timeline = json['timeline'].cast<String>();
    if (json['contact'] != null) {
      List<Contact> contact = [];
      json['contact'].forEach((v) {
        contact.add(Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['insti'] = this.insti;
    data['short_desc'] = this.shortDesc;
    data['about'] = this.about;
    data['details'] = this.details;
    data['prize'] = this.prize;
    data['judge'] = this.judge;
    if (this.rules != null) {
      data['rules'] = this.rules?.toJson();
    }
    data['submission'] = this.submission;
    data['timeline'] = this.timeline;
    if (this.contact != null) {
      data['contact'] = this.contact?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rules {
  List<String>? eligible;
  List<String>? guide;

  Rules({this.eligible, this.guide});

  Rules.fromJson(Map<String, dynamic> json) {
    eligible = json['eligible'].cast<String>();
    guide = json['guide'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['eligible'] = this.eligible;
    data['guide'] = this.guide;
    return data;
  }
}

class Contact {
  String? name;
  String? phone;
  String? insta;
  String? mail;

  Contact({this.name, this.phone, this.insta, this.mail});

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    insta = json['insta'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['insta'] = this.insta;
    data['mail'] = this.mail;
    return data;
  }
}
