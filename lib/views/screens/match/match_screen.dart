import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/utils/dimen_const.dart';
import 'package:hockey_live_score/views/screens/team/team_screen.dart';
import 'package:hockey_live_score/views/widgets/custom_loading.dart';
import 'package:hockey_live_score/views/widgets/match_card.dart';

import '../../../controller/match_controller.dart';
import '../../../utils/color_const.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: false,
        title: Obx(
          () => CustomText(
            text: "${'matches'.tr} - ${matchController.date}",
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Get.to(() => const SearchScreen(), arguments: {
              //   'matches': matchController.matches,
              // });
            },
            icon: Icon(
              Icons.search,
              color: secondaryColor,
            ),
          ),
          IconButton(
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: matchController.selectedDate.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null &&
                  picked != matchController.selectedDate.value) {
                matchController.setDate(picked);
              }
            },
            icon: Icon(
              Icons.calendar_month,
              color: secondaryColor,
            ),
          ),
        ],
      ),
      body: Obx(
        () => matchController.isLoading.value
            ? const Center(
                child: CustomLoading(),
              )
            : Padding(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const TeamScreen());
                      },
                      child: CustomCard(
                        widget: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  color: secondaryColor,
                                  Icons.sports_hockey,
                                  size: 18.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const CustomText(text: 'KHL')
                              ],
                            ),
                            kSizedBoxH5,
                            Divider(height: 1.h, color: grey.withOpacity(0.3)),
                            kSizedBoxH5,
                            const MatchCard(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
