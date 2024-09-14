import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hockey_live_score/models/match_detail_model.dart';
import 'package:hockey_live_score/models/match_model.dart';
import 'package:hockey_live_score/models/team_model.dart';
import 'package:hockey_live_score/services/api_constant.dart';
import 'package:hockey_live_score/services/api_utils.dart';
import 'package:intl/intl.dart';

import '../utils/custom_exception.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  /// Matches
  Future<List<MatchModel>> getMatches(String date) async {
    var tDate = "${date}T04:00:00";
    DateTime fromDateTime = DateTime.parse(tDate);
    DateTime fTime = fromDateTime.subtract(const Duration(days: 1));
    var fromDate = "${DateFormat('yyyy-MM-dd').format(fTime)}T03:59:59";
    try {
      final response = await apiUtils.get(
          url:
              "${ApiConstant.baseUrl}v3/en/matches/ice_hockey/from/$fromDate/to/$tDate",
          queryParameters: {
            "oddsPresentationConfigsId": "BETWAY_AFRICA_APP_PLAIN_1X2_V2",
            "oddsProviderIds": 11
          });
      final matches = response.data['matches'] as List;
      return matches.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  /// Matches Detail
  Future<MatchDetailsModel> getMatchesDetail(String id) async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseUrl}v1/en/match/ice_hockey/full/$id",
          queryParameters: {
            "oddsPresentationConfigsId": "BETWAY_AFRICA_APP_PLAIN_1X2_V2",
            "oddsProviderIds": 11,
            "boxscore": 1,
            "estats": 1,
            "gl": 1,
            "pbp": 1,
            "tf": 1,
            "tlge": 1,
            "wh2h": 1,
            "wstats": 1,
            "wtops": 1
          });
      final matchDetail = response.data;
      return MatchDetailsModel.fromJson(matchDetail);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  ///Team
  Future<TeamModel> getTeam(String tId) async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseUrl}v1/en/team/ice_hockey/teampage/$tId",
          queryParameters: {
            "oddsPresentationConfigsId": "BETWAY_AFRICA_APP_PLAIN_1X2_V2",
            "oddsProviderIds": 11,
            "epstats": 1
          });
      final team = response.data;
      return TeamModel.fromJson(team);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  /// Live
  Future<List<MatchModel>> getLive() async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseUrl}v1/en/matches/ice_hockey/live",
          queryParameters: {
            "oddsPresentationConfigsId": "BETWAY_AFRICA_APP_PLAIN_1X2_V2",
            "oddsProviderIds": 11
          });
      final matches = response.data['matches'] as List;
      return matches.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
