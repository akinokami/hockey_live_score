import 'package:get/get.dart';
import 'package:hockey_live_score/models/h2h_model.dart';
import 'package:hockey_live_score/models/match_detail_model.dart';

import '../models/match_model.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class MatchController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> matches = <MatchModel>[].obs;
  Rx<MatchDetailsModel> matchDetail = MatchDetailsModel().obs;
  Rx<H2HModel> h2hData = H2HModel().obs;

  var selectedDate = DateTime.now().obs;
  final date = ''.obs;

  @override
  void onInit() {
    date.value = formatDate(DateTime.now());
    print("Date onInit: ${date.value}");
    getMatches();
    super.onInit();
  }

  void setDate(DateTime pickedDate) {
    date.value = formatDate(pickedDate);

    print("Date : ${date.value}");
    getMatches();
  }

  Future<void> getMatches() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatches(date.value);
      matches.value = result;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }

  ///Match Detail
  Future<void> getMatchesDetail(String id) async {

    isLoading.value = true;
    try {
      final result = await ApiRepo().getMatchesDetail(id);
      matchDetail.value = result;

    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
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
