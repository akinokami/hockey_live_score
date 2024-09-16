import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/match_model.dart';

class SearchMatchController extends GetxController {
  final isLoading = false.obs;
  RxList<MatchModel> matches = <MatchModel>[].obs;
  final searchTxtController = TextEditingController();
  RxList<MatchModel> searchMatches = <MatchModel>[].obs;

  @override
  void onInit() {
    matches.value = Get.arguments['matches'];
    searchMatch();
    super.onInit();
  }

  void searchMatch() {
    isLoading.value = true;
    if (searchTxtController.text != '') {
      searchMatches.value = matches
          .where((element) =>
              (element.cName ?? '')
                  .toLowerCase()
                  .contains(searchTxtController.text.toLowerCase()) ||
              (element.stName ?? '')
                  .toLowerCase()
                  .contains(searchTxtController.text.toLowerCase()))
          .toList();
    } else {
      searchMatches.value = matches;
    }
    isLoading.value = false;
  }
}
