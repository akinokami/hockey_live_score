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
            : matchController.matches.isEmpty
                ? Center(
                    child: CustomText(text: 'no_data'.tr),
                  )
                : Padding(
                    padding: EdgeInsets.all(5.w),
                    child: ListView.builder(
                        itemCount: matchController.matches.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.w),
                            child: ExpansionTile(
                              initiallyExpanded: index==0?true:false,
                              backgroundColor: cardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r)),
                              collapsedBackgroundColor: cardColor,
                              collapsedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r)),
                              childrenPadding: EdgeInsets.all(10.w),
                              iconColor: whiteColor,
                              collapsedIconColor: whiteColor,
                              leading: Icon(
                                Icons.sports_hockey_outlined,
                                size: 18.sp,
                                color: whiteColor,
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text:
                                          "${matchController.matches[index].cName} - ${matchController.matches[index].stName}",
                                      maxLines: 2,
                                    ),
                                  ),
                                  CustomText(
                                      text:
                                          "${matchController.matches[index].matches?.length}"),
                                ],
                              ),
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: matchController
                                        .matches[index].matches?.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index1) {
                                      return Column(
                                        children: [
                                          kSizedBoxH5,
                                          MatchCard(
                                            matches: matchController
                                                .matches[index]
                                                .matches?[index1],
                                          ),
                                          kSizedBoxH5,
                                          Visibility(
                                            visible: index1 !=
                                                (matchController.matches[index]
                                                            .matches?.length ??
                                                        1) -
                                                    1,
                                            child: Divider(
                                                height: 1.h,
                                                color: grey.withOpacity(0.3)),
                                          ),
                                        ],
                                      );
                                    })
                              ],
                            ),
                          );
                        }),
                  ),
      ),
    );
  }
}
