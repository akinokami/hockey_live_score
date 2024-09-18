class NewsModel {
  int? id;
  int? sport;
  String? participantId;
  String? source;
  String? service;
  String? type;
  String? title;
  String? text;
  String? url;
  String? date;
  String? language;
  // List<Null>? media;
  //Kudos? kudos;
  Author? author;
  int? flowType;
  String? sortId;
  String? externalId;
  int? gender;

  NewsModel(
      {this.id,
      this.sport,
      this.participantId,
      this.source,
      this.service,
      this.type,
      this.title,
      this.text,
      this.url,
      this.date,
      this.language, // this.media,
      // this.kudos,
      this.author,
      this.flowType,
      this.sortId,
      this.externalId,
      this.gender});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sport = json['sport'];
    participantId = json['participantId'];
    source = json['source'];
    service = json['service'];
    type = json['type'];
    title = json['title'];
    text = json['text'];
    url = json['url'];
    date = json['date'];
    language = json['language'];
    // if (json['media'] != null) {
    // 	media = <Null>[];
    // 	json['media'].forEach((v) { media!.add(new Null.fromJson(v)); });
    // }
    // kudos = json['kudos'] != null ? new Kudos.fromJson(json['kudos']) : null;
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    flowType = json['flowType'];
    sortId = json['sortId'];
    externalId = json['externalId'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport'] = sport;
    data['participantId'] = participantId;
    data['source'] = source;
    data['service'] = service;
    data['type'] = type;
    data['title'] = title;
    data['text'] = text;
    data['url'] = url;
    data['date'] = date;
    data['language'] = language;
    // if (this.media != null) {
    //   data['media'] = this.media!.map((v) => v.toJson()).toList();
    // }
    // if (this.kudos != null) {
    //   data['kudos'] = this.kudos!.toJson();
    // }
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['flowType'] = flowType;
    data['sortId'] = sortId;
    data['externalId'] = externalId;
    data['gender'] = gender;
    return data;
  }
}

// class Kudos {

// 	Kudos({});

// 	Kudos.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }

class Author {
  String? name;
  String? username;
  String? userid;
  String? url;

  Author({this.name, this.username, this.userid, this.url});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    userid = json['userid'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['userid'] = userid;
    data['url'] = url;
    return data;
  }
}
