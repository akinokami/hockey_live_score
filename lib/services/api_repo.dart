import 'package:hockey_live_score/models/match_model.dart';
import 'package:hockey_live_score/services/api_constant.dart';
import 'package:hockey_live_score/services/api_utils.dart';

import '../utils/custom_exception.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  /// Matches
  Future<List<MatchModel>> getMatches() async {
    try {
      final response = await apiUtils.get(
          url:
              "${ApiConstant.baseUrl}en/matches/ice_hockey/from/2024-09-11T04:00:00/to/2024-09-14T03:59:59",
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
