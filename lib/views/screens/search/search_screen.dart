import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/controller/search_match_controller.dart';
import 'package:hockey_live_score/utils/dimen_const.dart';
import 'package:hockey_live_score/views/widgets/custom_loading.dart';
import 'package:hockey_live_score/views/widgets/match_card.dart';

import '../../../utils/color_const.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchMatchController = Get.put(SearchMatchController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: CustomText(
          text: 'search'.tr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5.w),
            child: CustomTextFormField(
              controller: searchMatchController.searchTxtController,
              hintText: 'search'.tr,
              isValidate: false,
              onChange: (value) {
                searchMatchController.searchMatch();
              },
            ),
          ),
          kSizedBoxH10,
          Obx(
            () => searchMatchController.isLoading.value
                ? const Center(
                    child: CustomLoading(),
                  )
                : searchMatchController.searchMatches.isEmpty
                    ? Center(
                        child: CustomText(text: 'no_data'.tr),
                      )
                    : Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.w),
                          child: ListView.builder(
                              itemCount:
                                  searchMatchController.searchMatches.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: ExpansionTile(
                                    initiallyExpanded: false,
                                    backgroundColor: cardColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    collapsedBackgroundColor: cardColor,
                                    collapsedShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    childrenPadding: EdgeInsets.all(10.w),
                                    iconColor: whiteColor,
                                    collapsedIconColor: whiteColor,
                                    // leading: Icon(
                                    //   Icons.sports_hockey_outlined,
                                    //   size: 18.sp,
                                    //   color: whiteColor,
                                    // ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            text:
                                                "${searchMatchController.searchMatches[index].cName} - ${searchMatchController.searchMatches[index].stName}",
                                            maxLines: 2,
                                          ),
                                        ),
                                        CustomText(
                                            text:
                                                "${searchMatchController.searchMatches[index].matches?.length}"),
                                      ],
                                    ),
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: searchMatchController
                                              .searchMatches[index]
                                              .matches
                                              ?.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index1) {
                                            return Column(
                                              children: [
                                                kSizedBoxH5,
                                                MatchCard(
                                                  title:
                                                      "${searchMatchController.searchMatches[index].cName} - ${searchMatchController.searchMatches[index].stName}",
                                                  matches: searchMatchController
                                                      .matches[index]
                                                      .matches?[index1],
                                                ),
                                                kSizedBoxH5,
                                                Visibility(
                                                  visible: index1 !=
                                                      (searchMatchController
                                                                  .searchMatches[
                                                                      index]
                                                                  .matches
                                                                  ?.length ??
                                                              1) -
                                                          1,
                                                  child: Divider(
                                                      height: 1.h,
                                                      color: grey
                                                          .withOpacity(0.3)),
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
          ),
        ],
      ),
    );
  }
}
