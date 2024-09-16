// To parse this JSON data, do
//
//     final matchDetailsModel = matchDetailsModelFromJson(jsonString);

import 'dart:convert';

MatchDetailsModel matchDetailsModelFromJson(String str) => MatchDetailsModel.fromJson(json.decode(str));

String matchDetailsModelToJson(MatchDetailsModel data) => json.encode(data.toJson());

class FormTeamData {
  String? id;
  String? name;
  int? gender;
  dynamic cid;
  Cname? cname;
  Cflag? cflag;
  int? pos;
  int? idx;
  int? kn;
  List<FormsText>? formsText;
  List<MatchDetailsModel>? results;

  FormTeamData({
    this.id,
    this.name,
    this.gender,
    this.cid,
    this.cname,
    this.cflag,
    this.pos,
    this.idx,
    this.kn,
    this.formsText,
    this.results,
  });

  factory FormTeamData.fromJson(Map<String, dynamic> json) => FormTeamData(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    cid: json["cid"] ?? "",
    cname: cnameValues.map[json["cname"]],
    cflag: cflagValues.map[json["cflag"]],
    pos: json["pos"],
    idx: json["idx"],
    kn: json["kn"],
    formsText: json["formsText"] == null ? [] : List<FormsText>.from(json["formsText"]!.map((x) => formsTextValues.map[x]!)),
    results: json["results"] == null ? [] : List<MatchDetailsModel>.from(json["results"]!.map((x) => MatchDetailsModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "cid": cidValues.reverse[cid],
    "cname": cnameValues.reverse[cname],
    "cflag": cflagValues.reverse[cflag],
    "pos": pos,
    "idx": idx,
    "kn": kn,
    "formsText": formsText == null ? [] : List<dynamic>.from(formsText!.map((x) => formsTextValues.reverse[x])),
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class MatchDetailsModel {
  int? pid;
  int? sId;

  String? cId;
  CName? cName;
  CFlag? cFlag;
  String? stId;
  StName? stName;
  int? format;
  String? id;
  List<Pid>? pids;
  int? ut;
  StatusTxt? statusTxt;
  int? status;
  int? pStatus;
  int? oStatus;
  int? poStatus;
  int? elapsedT;
  int? start;
  int? aStart;
  int? aEnd;
  int? cov;
  List<int>? score;
  List<int>? the1PScore;
  List<int>? the2PScore;
  List<int>? the3PScore;
  int? highlighted;
  int? canEndWithDraw;
  String? season;
  int? noTable;
  int? noScorers;
  List<Team>? teams;
  int? hasIncs;
  List<FormTeamData>? formsTeamData;
  List<Lte>? lte;
  Wh2H? wh2H;
  List<int>? oScore;
  List<int>? penScore;

  MatchDetailsModel({
    this.pid,
    this.sId,
    this.cId,
    this.cName,
    this.cFlag,
    this.stId,
    this.stName,
    this.format,
    this.id,
    this.pids,
    this.ut,
    this.statusTxt,
    this.status,
    this.pStatus,
    this.oStatus,
    this.poStatus,
    this.elapsedT,
    this.start,
    this.aStart,
    this.aEnd,
    this.cov,
    this.score,
    this.the1PScore,
    this.the2PScore,
    this.the3PScore,
    this.highlighted,
    this.canEndWithDraw,
    this.season,
    this.noTable,
    this.noScorers,
    this.teams,
    this.hasIncs,
    this.formsTeamData,
    this.lte,
    this.wh2H,
    this.oScore,
    this.penScore,
  });

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) => MatchDetailsModel(
    pid: json["pid"],
    sId: json["s_id"],
    cId: json["c_id"],
    cName: cNameValues.map[json["c_name"]],
    cFlag:json["c_flag"]==null? "" :json["c_flag"]??"",
    stId: json["st_id"],
    stName:json["st_name"]==null? "" : json["st_name"]??"",
    format: json["format"],
    id: json["id"],
    pids: json["pids"] == null ? [] : List<Pid>.from(json["pids"]!.map((x) => Pid.fromJson(x))),
    ut: json["ut"],
    statusTxt:json["status_txt"]==null? "" : json["status_txt"]??"",
    status: json["status"],
    pStatus: json["p_status"],
    oStatus: json["o_status"],
    poStatus: json["po_status"],
    elapsedT: json["elapsed_t"],
    start: json["start"],
    aStart: json["a_start"],
    aEnd: json["a_end"],
    cov: json["cov"],
    score: json["score"] == null ? [] : List<int>.from(json["score"]!.map((x) => x)),
    the1PScore: json["1p_score"] == null ? [] : List<int>.from(json["1p_score"]!.map((x) => x)),
    the2PScore: json["2p_score"] == null ? [] : List<int>.from(json["2p_score"]!.map((x) => x)),
    the3PScore: json["3p_score"] == null ? [] : List<int>.from(json["3p_score"]!.map((x) => x)),
    highlighted: json["highlighted"],
    canEndWithDraw: json["can_end_with_draw"],
    season: json["season"],
    noTable: json["noTable"],
    noScorers: json["noScorers"],
    teams: json["teams"] == null ? [] : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
    hasIncs: json["has_incs"],
    formsTeamData: json["forms"] == null ? [] : List<FormTeamData>.from(json["forms"]!.map((x) => FormTeamData.fromJson(x))),
    lte: json["lte"] == null ? [] : List<Lte>.from(json["lte"]!.map((x) => Lte.fromJson(x))),
    wh2H: json["wh2h"] == null ? null : Wh2H.fromJson(json["wh2h"]),
    oScore: json["o_score"] == null ? [] : List<int>.from(json["o_score"]!.map((x) => x)),
    penScore: json["pen_score"] == null ? [] : List<int>.from(json["pen_score"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "pid": pid,
    "s_id": sId,
    "c_id": cId,
    "c_name": cNameValues.reverse[cName],
    "c_flag": cFlagValues.reverse[cFlag],
    "st_id": stId,
    "st_name": stNameValues.reverse[stName],
    "format": format,
    "id": id,
    "pids": pids == null ? [] : List<dynamic>.from(pids!.map((x) => x.toJson())),
    "ut": ut,
    "status_txt": statusTxtValues.reverse[statusTxt],
    "status": status,
    "p_status": pStatus,
    "o_status": oStatus,
    "po_status": poStatus,
    "elapsed_t": elapsedT,
    "start": start,
    "a_start": aStart,
    "a_end": aEnd,
    "cov": cov,
    "score": score == null ? [] : List<dynamic>.from(score!.map((x) => x)),
    "1p_score": the1PScore == null ? [] : List<dynamic>.from(the1PScore!.map((x) => x)),
    "2p_score": the2PScore == null ? [] : List<dynamic>.from(the2PScore!.map((x) => x)),
    "3p_score": the3PScore == null ? [] : List<dynamic>.from(the3PScore!.map((x) => x)),
    "highlighted": highlighted,
    "can_end_with_draw": canEndWithDraw,
    "season": season,
    "noTable": noTable,
    "noScorers": noScorers,
    "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x.toJson())),
    "has_incs": hasIncs,
    "forms": formsTeamData == null ? [] : List<dynamic>.from(formsTeamData!.map((x) => x.toJson())),
    "lte": lte == null ? [] : List<dynamic>.from(lte!.map((x) => x.toJson())),
    "wh2h": wh2H?.toJson(),
    "o_score": oScore == null ? [] : List<dynamic>.from(oScore!.map((x) => x)),
    "pen_score": penScore == null ? [] : List<dynamic>.from(penScore!.map((x) => x)),
  };
}

enum Cflag {
  THE_222
}

final cflagValues = EnumValues({
  "2/22": Cflag.THE_222
});

enum Cid {
  THE_122
}

final cidValues = EnumValues({
  "1-22": Cid.THE_122
});

enum Cname {
  RUSSIA
}

final cnameValues = EnumValues({
  "Russia": Cname.RUSSIA
});

enum FormsText {
  L,
  W
}

final formsTextValues = EnumValues({
  "L": FormsText.L,
  "W": FormsText.W
});

enum CFlag {
  THE_17_D4_FC5_D5_CC47_4_DAC_958_E_A52283_A0_DDF2,
  THE_19_E01_BFDA_BF53_4_C9_B_B13_F_9_F3_DFAC23_E7_D
}

final cFlagValues = EnumValues({
  "1/7d4fc5d5-cc47-4dac-958e-a52283a0ddf2": CFlag.THE_17_D4_FC5_D5_CC47_4_DAC_958_E_A52283_A0_DDF2,
  "1/9e01bfda-bf53-4c9b-b13f-9f3dfac23e7d": CFlag.THE_19_E01_BFDA_BF53_4_C9_B_B13_F_9_F3_DFAC23_E7_D
});

enum CName {
  INTERNATIONAL,
  KHL
}

final cNameValues = EnumValues({
  "International": CName.INTERNATIONAL,
  "KHL": CName.KHL
});

class Lte {
  int? ranking;
  String? teamId;
  String? teamName;
  String? played;
  String? wins;
  String? draws;
  String? loss;
  String? goalFor;
  String? goalAgainst;
  String? goalDifference;
  String? points;

  Lte({
    this.ranking,
    this.teamId,
    this.teamName,
    this.played,
    this.wins,
    this.draws,
    this.loss,
    this.goalFor,
    this.goalAgainst,
    this.goalDifference,
    this.points,
  });

  factory Lte.fromJson(Map<String, dynamic> json) => Lte(
    ranking: json["ranking"],
    teamId: json["team_id"],
    teamName: json["team_name"],
    played: json["played"],
    wins: json["wins"],
    draws: json["draws"],
    loss: json["loss"],
    goalFor: json["goal_for"],
    goalAgainst: json["goal_against"],
    goalDifference: json["goal_difference"],
    points: json["points"],
  );

  Map<String, dynamic> toJson() => {
    "ranking": ranking,
    "team_id": teamId,
    "team_name": teamName,
    "played": played,
    "wins": wins,
    "draws": draws,
    "loss": loss,
    "goal_for": goalFor,
    "goal_against": goalAgainst,
    "goal_difference": goalDifference,
    "points": points,
  };
}

class Pid {
  int? pid;
  String? id;

  Pid({
    this.pid,
    this.id,
  });

  factory Pid.fromJson(Map<String, dynamic> json) => Pid(
    pid: json["pid"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "pid": pid,
    "id": id,
  };
}

enum SCode {
  ICE_HOCKEY
}

final sCodeValues = EnumValues({
  "ice_hockey": SCode.ICE_HOCKEY
});

enum StName {
  CLUB_FRIENDLIES,
  REGULAR_SEASON
}

final stNameValues = EnumValues({
  "Club Friendlies": StName.CLUB_FRIENDLIES,
  "Regular Season": StName.REGULAR_SEASON
});

enum StatusTxt {
  FT,
  NS,
  OT
}

final statusTxtValues = EnumValues({
  "FT": StatusTxt.FT,
  "NS": StatusTxt.NS,
  "OT": StatusTxt.OT
});

class Team {
  String? id;
  String? name;
  int? gender;
  Cid? cid;
  Cname? cname;
  Cflag? cflag;
  int? pos;
  int? idx;
  int? kn;
  int? ptrn;
  int? assists;
  int? goals;
  int? ownGoals;
  int? red;
  int? yellow;
  int? the2NdYellow;

  Team({
    this.id,
    this.name,
    this.gender,
    this.cid,
    this.cname,
    this.cflag,
    this.pos,
    this.idx,
    this.kn,
    this.ptrn,
    this.assists,
    this.goals,
    this.ownGoals,
    this.red,
    this.yellow,
    this.the2NdYellow,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
    cid: cidValues.map[json["cid"]]!,
    cname: cnameValues.map[json["cname"]]!,
    cflag: cflagValues.map[json["cflag"]]!,
    pos: json["pos"],
    idx: json["idx"],
    kn: json["kn"],
    ptrn: json["ptrn"],
    assists: json["assists"],
    goals: json["goals"],
    ownGoals: json["own_goals"],
    red: json["red"],
    yellow: json["yellow"],
    the2NdYellow: json["2nd_yellow"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "cid": cidValues.reverse[cid],
    "cname": cnameValues.reverse[cname],
    "cflag": cflagValues.reverse[cflag],
    "pos": pos,
    "idx": idx,
    "kn": kn,
    "ptrn": ptrn,
    "assists": assists,
    "goals": goals,
    "own_goals": ownGoals,
    "red": red,
    "yellow": yellow,
    "2nd_yellow": the2NdYellow,
  };
}

class Wh2H {
  int? playedMatches;
  Teams? teams;

  Wh2H({
    this.playedMatches,
    this.teams,
  });

  factory Wh2H.fromJson(Map<String, dynamic> json) => Wh2H(
    playedMatches: json["played_matches"],
    teams: json["teams"] == null ? null : Teams.fromJson(json["teams"]),
  );

  Map<String, dynamic> toJson() => {
    "played_matches": playedMatches,
    "teams": teams?.toJson(),
  };
}

class Teams {
  Away? home;
  Away? away;

  Teams({
    this.home,
    this.away,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
    home: json["home"] == null ? null : Away.fromJson(json["home"]),
    away: json["away"] == null ? null : Away.fromJson(json["away"]),
  );

  Map<String, dynamic> toJson() => {
    "home": home?.toJson(),
    "away": away?.toJson(),
  };
}

class Away {
  String? name;
  int? numberOfWins;

  Away({
    this.name,
    this.numberOfWins,
  });

  factory Away.fromJson(Map<String, dynamic> json) => Away(
    name: json["name"],
    numberOfWins: json["number_of_wins"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number_of_wins": numberOfWins,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
