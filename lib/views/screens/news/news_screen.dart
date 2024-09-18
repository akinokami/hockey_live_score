import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/controller/new_controller.dart';
import 'package:hockey_live_score/utils/dimen_const.dart';
import 'package:hockey_live_score/views/screens/news/news_detail_screen.dart';
import 'package:hockey_live_score/views/widgets/custom_card.dart';
import 'package:hockey_live_score/views/widgets/custom_loading.dart';

import '../../../utils/color_const.dart';
import '../../widgets/custom_text.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: CustomText(
          text: 'news'.tr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => newsController.isLoading.value
            ? const Center(
                child: CustomLoading(),
              )
            : newsController.news.isEmpty
                ? Center(
                    child: CustomText(text: 'no_data'.tr),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: newsController.news.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => NewsDetailScreen(
                                newsModel: newsController.news[index],
                              ));
                        },
                        child: CustomCard(
                            widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: newsController.news[index].title ?? '',
                              fontWeight: FontWeight.bold,
                            ),
                            kSizedBoxH5,
                            CustomText(
                              text: newsController.news[index].desc ?? '',
                              maxLines: 2,
                            ),
                          ],
                        )),
                      );
                    }),
      ),
    );
  }
}
