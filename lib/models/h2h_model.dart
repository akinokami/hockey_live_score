// To parse this JSON data, do
//
//     final h2HModel = h2HModelFromJson(jsonString);

import 'dart:convert';

H2HModel h2HModelFromJson(String str) => H2HModel.fromJson(json.decode(str));

String h2HModelToJson(H2HModel data) => json.encode(data.toJson());

class H2HModel {
  H2H? h2H;

  H2HModel({
    this.h2H,
  });

  factory H2HModel.fromJson(Map<String, dynamic> json) => H2HModel(
    h2H: json["h2h"] == null ? null : H2H.fromJson(json["h2h"]),
  );

  Map<String, dynamic> toJson() => {
    "h2h": h2H?.toJson(),
  };
}

class H2H {
  List<Match>? matches;

  H2H({
    this.matches,
  });

  factory H2H.fromJson(Map<String, dynamic> json) => H2H(
    matches: json["matches"] == null ? [] : List<Match>.from(json["matches"]!.map((x) => Match.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "matches": matches == null ? [] : List<dynamic>.from(matches!.map((x) => x.toJson())),
  };
}

class Match {
  int? sId;
  int? pid;
  String? id;
  String? cId;
  CName? cName;
  String? stId;
  StName? stName;
  int? gid;
  String? season;
  List<Team>? teams;
  int? start;
  int? aStart;
  int? status;
  int? oStatus;
  int? win;
  List<int>? score;
  List<int>? the1PScore;
  List<int>? the2PScore;
  List<int>? the3PScore;
  int? highlighted;
  List<int>? oScore;
  List<int>? penScore;

  Match({
    this.sId,
    this.pid,
    this.id,
    this.cId,
    this.cName,
    this.stId,
    this.stName,
    this.gid,
    this.season,
    this.teams,
    this.start,
    this.aStart,
    this.status,
    this.oStatus,
    this.win,
    this.score,
    this.the1PScore,
    this.the2PScore,
    this.the3PScore,
    this.highlighted,
    this.oScore,
    this.penScore,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    sId: json["s_id"],
    pid: json["pid"],
    id: json["id"],
    cId: json["c_id"],
    cName: cNameValues.map[json["c_name"]]!,
    stId: json["st_id"],
    stName: stNameValues.map[json["st_name"]]!,
    gid: json["gid"],
    season: json["season"],
    teams: json["teams"] == null ? [] : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
    start: json["start"],
    aStart: json["a_start"],
    status: json["status"],
    oStatus: json["o_status"],
    win: json["win"],
    score: json["score"] == null ? [] : List<int>.from(json["score"]!.map((x) => x)),
    the1PScore: json["1p_score"] == null ? [] : List<int>.from(json["1p_score"]!.map((x) => x)),
    the2PScore: json["2p_score"] == null ? [] : List<int>.from(json["2p_score"]!.map((x) => x)),
    the3PScore: json["3p_score"] == null ? [] : List<int>.from(json["3p_score"]!.map((x) => x)),
    highlighted: json["highlighted"],
    oScore: json["o_score"] == null ? [] : List<int>.from(json["o_score"]!.map((x) => x)),
    penScore: json["pen_score"] == null ? [] : List<int>.from(json["pen_score"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "s_id": sId,
    "pid": pid,
    "id": id,
    "c_id": cId,
    "c_name": cNameValues.reverse[cName],
    "st_id": stId,
    "st_name": stNameValues.reverse[stName],
    "gid": gid,
    "season": season,
    "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x.toJson())),
    "start": start,
    "a_start": aStart,
    "status": status,
    "o_status": oStatus,
    "win": win,
    "score": score == null ? [] : List<dynamic>.from(score!.map((x) => x)),
    "1p_score": the1PScore == null ? [] : List<dynamic>.from(the1PScore!.map((x) => x)),
    "2p_score": the2PScore == null ? [] : List<dynamic>.from(the2PScore!.map((x) => x)),
    "3p_score": the3PScore == null ? [] : List<dynamic>.from(the3PScore!.map((x) => x)),
    "highlighted": highlighted,
    "o_score": oScore == null ? [] : List<dynamic>.from(oScore!.map((x) => x)),
    "pen_score": penScore == null ? [] : List<dynamic>.from(penScore!.map((x) => x)),
  };
}

enum CName {
  KHL,
  RUSSIA
}

final cNameValues = EnumValues({
  "KHL": CName.KHL,
  "Russia": CName.RUSSIA
});

enum StName {
  KHL,
  REGULAR_SEASON
}

final stNameValues = EnumValues({
  "KHL": StName.KHL,
  "Regular Season": StName.REGULAR_SEASON
});

class Team {
  Id? id;
  Name? name;
  int? pos;

  Team({
    this.id,
    this.name,
    this.pos,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: idValues.map[json["id"]]!,
    name: nameValues.map[json["name"]]!,
    pos: json["pos"],
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": nameValues.reverse[name],
    "pos": pos,
  };
}

enum Id {
  THE_165724,
  THE_165731
}

final idValues = EnumValues({
  "1-65724": Id.THE_165724,
  "1-65731": Id.THE_165731
});

enum Name {
  BARYS_NUR_SULTAN,
  DINAMO_MINSK
}

final nameValues = EnumValues({
  "Barys Nur-Sultan": Name.BARYS_NUR_SULTAN,
  "Dinamo Minsk": Name.DINAMO_MINSK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
