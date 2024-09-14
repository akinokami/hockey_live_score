import 'package:hockey_live_score/models/match_model.dart';

class TeamModel {
  String? name;
  String? id;
  int? gender;
  List<Stages>? stages;
  List<Participants>? participants;
  List<Matches>? results;
  List<Matches>? fixtures;

  TeamModel(
      {this.name,
      this.id,
      this.gender,
      this.stages,
      this.participants,
      this.results,
      this.fixtures});

  TeamModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    gender = json['gender'];
    if (json['stages'] != null) {
      stages = <Stages>[];
      json['stages'].forEach((v) {
        stages!.add(Stages.fromJson(v));
      });
    }
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(Participants.fromJson(v));
      });
    }
    if (json['results'] != null) {
      results = <Matches>[];
      json['results'].forEach((v) {
        results!.add(Matches.fromJson(v));
      });
    }
    if (json['fixtures'] != null) {
      fixtures = <Matches>[];
      json['fixtures'].forEach((v) {
        fixtures!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['gender'] = gender;
    if (stages != null) {
      data['stages'] = stages!.map((v) => v.toJson()).toList();
    }
    if (participants != null) {
      data['participants'] = participants!.map((v) => v.toJson()).toList();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (fixtures != null) {
      data['fixtures'] = fixtures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stages {
  String? cId;
  String? cName;
  String? cFlag;
  String? stId;
  String? stName;
  int? stGender;
  int? start;
  int? end;
  int? pid;
  int? sId;
  CupInfo? cupInfo;
  Standing? standing;
  List<String>? forms;

  Stages(
      {this.cId,
      this.cName,
      this.cFlag,
      this.stId,
      this.stName,
      this.stGender,
      this.start,
      this.end,
      this.pid,
      this.sId,
      this.cupInfo,
      this.standing,
      this.forms});

  Stages.fromJson(Map<String, dynamic> json) {
    cId = json['c_id'];
    cName = json['c_name'];
    cFlag = json['c_flag'];
    stId = json['st_id'];
    stName = json['st_name'];
    stGender = json['st_gender'];
    start = json['start'];
    end = json['end'];
    pid = json['pid'];
    sId = json['s_id'];
    cupInfo =
        json['cupInfo'] != null ? CupInfo.fromJson(json['cupInfo']) : null;
    standing =
        json['standing'] != null ? Standing.fromJson(json['standing']) : null;
    forms = json['forms'] != null ? json['forms'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['c_id'] = cId;
    data['c_name'] = cName;
    data['c_flag'] = cFlag;
    data['st_id'] = stId;
    data['st_name'] = stName;
    data['st_gender'] = stGender;
    data['start'] = start;
    data['end'] = end;
    data['pid'] = pid;
    data['s_id'] = sId;
    if (cupInfo != null) {
      data['cupInfo'] = cupInfo!.toJson();
    }
    if (standing != null) {
      data['standing'] = standing!.toJson();
    }
    data['forms'] = forms;
    return data;
  }
}

class CupInfo {
  int? isCupInfoAvailable;
  int? isCup;

  CupInfo({this.isCupInfoAvailable, this.isCup});

  CupInfo.fromJson(Map<String, dynamic> json) {
    isCupInfoAvailable = json['isCupInfoAvailable'];
    isCup = json['isCup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isCupInfoAvailable'] = isCupInfoAvailable;
    data['isCup'] = isCup;
    return data;
  }
}

class Standing {
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

  Standing(
      {this.ranking,
      this.teamId,
      this.teamName,
      this.played,
      this.wins,
      this.draws,
      this.loss,
      this.goalFor,
      this.goalAgainst,
      this.goalDifference,
      this.points});

  Standing.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    teamId = json['team_id'];
    teamName = json['team_name'];
    played = json['played'];
    wins = json['wins'];
    draws = json['draws'];
    loss = json['loss'];
    goalFor = json['goal_for'];
    goalAgainst = json['goal_against'];
    goalDifference = json['goal_difference'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['team_id'] = teamId;
    data['team_name'] = teamName;
    data['played'] = played;
    data['wins'] = wins;
    data['draws'] = draws;
    data['loss'] = loss;
    data['goal_for'] = goalFor;
    data['goal_against'] = goalAgainst;
    data['goal_difference'] = goalDifference;
    data['points'] = points;
    return data;
  }
}

class Participants {
  String? id;
  String? name;
  int? gender;
  String? cid;
  String? cname;
  String? cflag;
  int? pos;
  int? idx;
  int? kn;
  int? ptrn;
  String? sNumber;

  Participants(
      {this.id,
      this.name,
      this.gender,
      this.cid,
      this.cname,
      this.cflag,
      this.pos,
      this.idx,
      this.kn,
      this.ptrn,
      this.sNumber});

  Participants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    cid = json['cid'];
    cname = json['cname'];
    cflag = json['cflag'];
    pos = json['pos'];
    idx = json['idx'];
    kn = json['kn'];
    ptrn = json['ptrn'];
    sNumber = json['s_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['cid'] = cid;
    data['cname'] = cname;
    data['cflag'] = cflag;
    data['pos'] = pos;
    data['idx'] = idx;
    data['kn'] = kn;
    data['ptrn'] = ptrn;
    data['s_number'] = sNumber;
    return data;
  }
}

class Results {
  int? sId;
  int? pid;
  String? id;
  String? cId;
  String? cName;
  String? stId;
  String? stName;
  int? gid;
  String? season;
  List<Teams>? teams;
  int? start;
  int? aStart;
  int? status;
  int? oStatus;
  int? win;
  List<int>? score;
  List<int>? l1pScore;
  List<int>? l2pScore;
  List<int>? l3pScore;
  int? highlighted;
  List<int>? oScore;

  Results(
      {this.sId,
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
      this.l1pScore,
      this.l2pScore,
      this.l3pScore,
      this.highlighted,
      this.oScore});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    pid = json['pid'];
    id = json['id'];
    cId = json['c_id'];
    cName = json['c_name'];
    stId = json['st_id'];
    stName = json['st_name'];
    gid = json['gid'];
    season = json['season'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
    start = json['start'];
    aStart = json['a_start'];
    status = json['status'];
    oStatus = json['o_status'];
    win = json['win'];
    score = json['score'] != null ? json['score'].cast<int>() : [];
    l1pScore = json['1p_score'] != null ? json['1p_score'].cast<int>() : [];
    l2pScore = json['2p_score'] != null ? json['2p_score'].cast<int>() : [];
    l3pScore = json['3p_score'] != null ? json['3p_score'].cast<int>() : [];
    highlighted = json['highlighted'];
    oScore = json['o_score'] != null ? json['o_score'].cast<int>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['s_id'] = sId;
    data['pid'] = pid;
    data['id'] = id;
    data['c_id'] = cId;
    data['c_name'] = cName;
    data['st_id'] = stId;
    data['st_name'] = stName;
    data['gid'] = gid;
    data['season'] = season;
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    data['start'] = start;
    data['a_start'] = aStart;
    data['status'] = status;
    data['o_status'] = oStatus;
    data['win'] = win;
    data['score'] = score;
    data['1p_score'] = l1pScore;
    data['2p_score'] = l2pScore;
    data['3p_score'] = l3pScore;
    data['highlighted'] = highlighted;
    data['o_score'] = oScore;
    return data;
  }
}

class Teams {
  String? id;
  String? name;
  int? pos;

  Teams({this.id, this.name, this.pos});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pos = json['pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['pos'] = pos;
    return data;
  }
}

class Fixtures {
  int? sId;
  int? pid;
  String? id;
  String? cId;
  String? cName;
  String? stId;
  String? stName;
  int? gid;
  String? season;
  List<Teams>? teams;
  int? start;
  int? aStart;
  int? status;
  int? oStatus;
  List<int>? score;
  List<int>? l1pScore;
  int? highlighted;

  Fixtures(
      {this.sId,
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
      this.score,
      this.l1pScore,
      this.highlighted});

  Fixtures.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    pid = json['pid'];
    id = json['id'];
    cId = json['c_id'];
    cName = json['c_name'];
    stId = json['st_id'];
    stName = json['st_name'];
    gid = json['gid'];
    season = json['season'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
    start = json['start'];
    aStart = json['a_start'];
    status = json['status'];
    oStatus = json['o_status'];
    score = json['score'] != null ? json['score'].cast<int>() : [];
    l1pScore = json['1p_score'] != null ? json['1p_score'].cast<int>() : [];
    highlighted = json['highlighted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['s_id'] = sId;
    data['pid'] = pid;
    data['id'] = id;
    data['c_id'] = cId;
    data['c_name'] = cName;
    data['st_id'] = stId;
    data['st_name'] = stName;
    data['gid'] = gid;
    data['season'] = season;
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    data['start'] = start;
    data['a_start'] = aStart;
    data['status'] = status;
    data['o_status'] = oStatus;
    data['score'] = score;
    data['1p_score'] = l1pScore;
    data['highlighted'] = highlighted;
    return data;
  }
}
