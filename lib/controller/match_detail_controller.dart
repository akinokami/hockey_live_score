import 'package:get/get.dart';
import 'package:hockey_live_score/models/h2h_model.dart';
import 'package:hockey_live_score/models/match_detail_model.dart';

import '../models/match_model.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class MatchDetailController extends GetxController {
  final isLoading = false.obs;
  Rx<MatchDetailsModel> matchDetail = MatchDetailsModel().obs;
  Rx<H2HModel> h2hData = H2HModel().obs;



  @override
  void onInit() {
   //

    super.onInit();
  }







  ///Head to Head
  Future<void> getH2HData(String team1,String team2) async {

    isLoading.value = true;

    try {
      final result = await ApiRepo().getHeadToHead(team1,team2);
      h2hData.value = result;
      isLoading.value = false;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}
