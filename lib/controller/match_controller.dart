import 'package:get/get.dart';

import '../models/match_model.dart';
import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class MatchController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> matches = <MatchModel>[].obs;

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
}
