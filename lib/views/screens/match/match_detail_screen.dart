import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/controller/match_detail_controller.dart';
import 'package:hockey_live_score/models/match_model.dart';
import 'package:hockey_live_score/views/screens/match/h2h_widget.dart';
import 'package:hockey_live_score/views/widgets/custom_loading.dart';
import '../../../models/h2h_model.dart';
import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../../utils/function.dart';
import '../../widgets/custom_text.dart';
import '../team/team_screen.dart';
import 'info_widget.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key, required this.matchTitle, this.matches, this.h2hModel});
  final String matchTitle;
  final Matches? matches;
  final H2HModel? h2hModel;
  @override
  Widget build(BuildContext context) {
    final matchDetailController = Get.put(MatchDetailController());
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: primaryColor,
            centerTitle: true,
            title: CustomText(
                text: matchTitle ?? '',
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(20.r),
                  //   bottomRight: Radius.circular(20.r),
                  // ),
                ),
                child: Column(
                  children: [
                    kSizedBoxH15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const TeamScreen(), arguments: {
                              'teamId': (matches?.teams ?? []).isNotEmpty
                                  ? (matches?.teams?[0].id ?? '')
                                  : ""
                            });
                          },
                          child: SizedBox(
                            width: 100.w,
                            height: 70.h,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.r),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: secondaryColor,
                                  ),
                                  child: Icon(Icons.sports_hockey,
                                      color: Colors.white, size: 20.sp),
                                ),
                                kSizedBoxH10,
                                CustomText(
                                  maxLines: 3,
                                  text: matches?.teams?[0].name ?? '',
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                  fontSize: 10.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                          height: 70.h,
                          child: (matches?.status != 1)
                              ? Center(
                                  child: CustomText(
                                    fontSize: 14.sp,
                                    text:
                                        "${matches?.score?[0] ?? ""} - ${matches?.score?[1] ?? ""}",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Center(
                                  child: CustomText(
                                    text: "soon".tr,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const TeamScreen(), arguments: {
                              'teamId': (matches?.teams ?? []).length > 1
                                  ? (matches?.teams?[1].id ?? '')
                                  : ""
                            });
                          },
                          child: SizedBox(
                            width: 100.w,
                            height: 70.h,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.r),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: secondaryColor,
                                  ),
                                  child: Icon(Icons.sports_hockey,
                                      color: Colors.white, size: 20.sp),
                                ),
                                kSizedBoxH10,
                                CustomText(
                                  maxLines: 3,
                                  text: matches?.teams?[1].name ?? '',
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                  fontSize: 10.sp,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    kSizedBoxH10,
                    kSizedBoxH15,
                    Divider(
                      height: 2.h,
                      color: whiteColor.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              kSizedBoxH5,
              Container(
                padding: EdgeInsets.all(2.w),
                margin: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: cardColor,
                  border: Border(
                    top: BorderSide(color: secondaryColor, width: 1.h),
                    bottom: BorderSide(color: secondaryColor, width: 1.h),
                    left: BorderSide(color: secondaryColor, width: 1.h),
                    right: BorderSide(color: secondaryColor, width: 1.h),
                  ),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: TabBar(
                  onTap: (value){
                    if(value==1){
                      matchDetailController.getH2HData(matches?.teams?[0].id.toString() ?? "",
                          matches?.teams?[1].id.toString() ?? "");
                    }
                  },
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: secondaryColor,
                  ),
                   indicatorSize: TabBarIndicatorSize.tab,
                   indicatorColor: cardColor,
                  unselectedLabelColor: whiteColor,
                  labelColor: whiteColor,

                  //indicatorWeight: 5.h,
                  tabs: [
                    Tab(
                      text: 'info'.tr,
                    ),

                    Tab(
                      text: 'h2h'.tr,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  InfoWidget(
                    matches: matches,
                  ),
                  Obx(()=>
                  (matchDetailController.isLoading.value)?
                 const CustomLoading():
                  ((matchDetailController.h2hData.value.h2H?.matches?.length??0)>0) ? ListView.builder(
                        itemCount: matchDetailController.h2hData.value.h2H?.matches?.length ?? 0,
                        itemBuilder: (context, index) {
                          print("Team value ${(matchDetailController.h2hData.value.h2H?.matches?[index].teams?[0].id)}");
                          print("Win value ${(matchDetailController.h2hData.value.h2H?.matches?[index].win)}");
                          return Container(
                            margin:
                            EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
                            decoration: BoxDecoration(
                              color: cardColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      topRight: Radius.circular(10.r),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          text:
                                          "${matchDetailController.h2hData.value.h2H?.matches?[index].cName ?? ""} : ${matchDetailController.h2hData.value.h2H?.matches?[index].stName ?? ""}"),
                                      CustomText(
                                          text: (matchDetailController.h2hData.value.h2H?.matches?[index].season ??
                                              "")),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  // color: cardColor.withOpacity(0.8),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        color: lightWhiteColor.withOpacity(0.6),
                                        text: getDate(matchDetailController.h2hData.value.h2H?.matches?[index].start
                                            .toString() ??
                                            ""),
                                        fontSize: 10.sp,
                                      ),
                                      kSizedBoxW5,

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 200.w,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        size:15.w,
                                                        Icons.sports_hockey_outlined,
                                                        color: secondaryColor,
                                                      ),
                                                      kSizedBoxW5,
                                                      CustomText(
                                                        color:("1-${matchDetailController.h2hData.value.h2H?.matches?[index].win.toString()}")==(matchDetailController.h2hData.value.h2H?.matches?[index].teams?[0].id.toString())? secondaryColor: lightWhiteColor.withOpacity(0.8),
                                                          text: matchDetailController.h2hData.value.h2H
                                                              ?.matches?[index]
                                                              .teams?[0]
                                                              .name ??
                                                              ""),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 50.w,
                                                  child: CustomText(
                                                      textAlign: TextAlign.right,
                                                      text: matchDetailController.h2hData.value.h2H
                                                          ?.matches?[index]
                                                          .score?[0]
                                                          .toString() ??
                                                          ""),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 200.w,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        size:15.w,
                                                        Icons.sports_hockey_outlined,
                                                        color: secondaryColor,
                                                      ),
                                                      kSizedBoxW5,
                                                      CustomText(
                                                          color:("1-${matchDetailController.h2hData.value.h2H?.matches?[index].win.toString()}")==(matchDetailController.h2hData.value.h2H?.matches?[index].teams?[1].id.toString())? secondaryColor: lightWhiteColor.withOpacity(0.8),
                                                          text: matchDetailController.h2hData.value.h2H
                                                              ?.matches?[index]
                                                              .teams?[1]
                                                              .name ??
                                                              ""),
                                                    ],
                                                  ),
                                                ),
                                                kSizedBoxW5,
                                                SizedBox(
                                                  width: 50.w,
                                                  child: CustomText(
                                                      textAlign: TextAlign.right,
                                                      text: matchDetailController.h2hData.value.h2H
                                                          ?.matches?[index]
                                                          .score?[1]
                                                          .toString() ??
                                                          ""),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }):CustomText(text: "no_data".tr),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
