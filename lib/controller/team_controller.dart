import 'package:get/get.dart';
import 'package:hockey_live_score/models/team_model.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';

class TeamController extends GetxController {
  final isLoading = false.obs;
  Rx<TeamModel> team = TeamModel().obs;
  final teamId = "".obs;

  @override
  void onInit() {
    teamId.value = "1-65727"; //Get.arguments['teamId'];
    getTeam();
    super.onInit();
  }

  Future<void> getTeam() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getTeam(teamId.value);
      team.value = result;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}
