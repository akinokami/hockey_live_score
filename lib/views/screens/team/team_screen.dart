import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/views/screens/team/result_widget.dart';
import 'package:hockey_live_score/views/screens/team/upcoming_widget.dart';

import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_text.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final teamController = Get.put(TeamController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: secondaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: CustomText(
            text: ''.tr,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Container(
              color: secondaryColor,
              child: Column(
                children: [
                  Icon(
                    Icons.sports_basketball,
                    size: 40.sp,
                    color: Colors.white,
                  ),
                  kSizedBoxW5,
                  CustomText(
                    text: 'TEAM NAME'.tr,
                    color: Colors.white,
                  ),
                  CustomText(
                    text: 'NHL'.tr,
                    color: Colors.white,
                  ),
                  TabBar(
                    onTap: (value) {
                      // if (value == 1) {
                      //   teamController.getPlayer();
                      // }
                    },
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: 'upcoming_matches'.tr),
                      Tab(text: 'results'.tr),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [UpcomingWidget(), ResultWidget()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
