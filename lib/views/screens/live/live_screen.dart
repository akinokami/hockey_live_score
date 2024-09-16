import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/controller/live_controller.dart';
import 'package:hockey_live_score/utils/dimen_const.dart';
import 'package:hockey_live_score/views/widgets/custom_loading.dart';
import 'package:hockey_live_score/views/widgets/match_card.dart';

import '../../../utils/color_const.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final liveController = Get.put(LiveController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: CustomText(
          text: 'live'.tr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => liveController.isLoading.value
            ? const Center(
                child: CustomLoading(),
              )
            : liveController.live.isEmpty
                ? Center(
                    child: CustomText(text: 'no_data'.tr),
                  )
                : Padding(
                    padding: EdgeInsets.all(5.w),
                    child: ListView.builder(
                        itemCount: liveController.live.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            widget: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.sports_hockey,
                                      size: 18.sp,
                                      color: secondaryColor,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    const CustomText(text: 'KHL')
                                  ],
                                ),
                                kSizedBoxH5,
                                Divider(
                                    height: 1.h, color: grey.withOpacity(0.3)),
                                kSizedBoxH5,
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: liveController
                                        .live[index].matches?.length,
                                    itemBuilder: (context, index1) {
                                      return MatchCard(
                                        matches: liveController
                                            .live[index].matches?[index1],
                                      );
                                    }),
                              ],
                            ),
                          );
                        }),
                  ),
      ),
    );
  }
}
