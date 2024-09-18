import 'package:get/get.dart';
import 'package:hockey_live_score/models/news_model.dart';

import '../services/api_repo.dart';
import '../utils/color_const.dart';
import '../utils/constants.dart';

class NewsController extends GetxController {
  final isLoading = false.obs;
  RxList<NewsModel> news = <NewsModel>[].obs;

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  Future<void> getNews() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getNews();
      news.value = result;
    } catch (e) {
      constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
    } finally {
      isLoading.value = false;
    }
  }
}
