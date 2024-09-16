import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/models/match_model.dart';

import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_text.dart';
import '../team/team_screen.dart';
import 'info_widget.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({super.key, required this.matchTitle, this.matches});
final String matchTitle;
final Matches? matches;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
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
                        Get.to(() => const TeamScreen(),
                            arguments: {'teamId': ""});
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
                              text:matches?.teams?[0].name ?? '',
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
                      child: (matches?.score != null)
                          ? Center(
                            child: CustomText(
                      fontSize: 14.sp,
                        text:
                        "${matches?.score?[0]??""} - ${matches?.score?[1]??""}",
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
                        Get.to(() => const TeamScreen(),
                            arguments: {'teamId': ""});
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
              color: whiteColor,
              border: Border(
                top: BorderSide(color: secondaryColor, width: 1.h),
                bottom: BorderSide(color: secondaryColor, width: 1.h),
                left: BorderSide(color: secondaryColor, width: 1.h),
                right: BorderSide(color: secondaryColor, width: 1.h),
              ),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: TabBar(
              //dividerColor: secondaryColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: secondaryColor,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: whiteColor,
              unselectedLabelColor: greyColor,
              labelColor: whiteColor,

              //indicatorWeight: 5.h,
              tabs: [
                Tab(
                  text: 'info'.tr,
                ),
                Tab(
                  text: 'standing'.tr,
                ),
                Tab(
                  text: 'h2h'.tr,
                ),
              ],
            ),
          ),
           Expanded(child: TabBarView(
            children: [
              InfoWidget(matches: matches,),
              CustomText(text: "2",color: Colors.black),
              CustomText(text: "3",color: Colors.black),
            ],
          ))
        ],
      ),
    ));
  }
}
