import 'package:get/get.dart';

import '../models/match_model.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';

class LiveController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> live = <MatchModel>[].obs;

  @override
  void onInit() {
    getLive();
    super.onInit();
  }

  Future<void> getLive() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getLive();
      live.value = result;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}
