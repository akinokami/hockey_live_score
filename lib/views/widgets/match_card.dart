import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/models/match_model.dart';
import 'package:hockey_live_score/utils/function.dart';
import 'package:hockey_live_score/views/screens/match/match_detail_screen.dart';
import 'package:hockey_live_score/views/widgets/custom_text.dart';

import '../../controller/match_controller.dart';
import '../../utils/color_const.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key,
    this.matches,
    this.title,
  });
  final Matches? matches;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final matchController = Get.put(MatchController());
    return InkWell(
      onTap: () {
       // matchController.getMatchesDetail(matches?.id.toString() ?? "");
        Get.to(MatchDetailScreen(
          matchTitle: title ?? "",
          matches: matches,
        ));
      },
      child: Row(
        children: [
          SizedBox(
            width: 1.sw * 0.15,
            child: CustomText(
              text: matches?.status == 70
                  ? "FT"
                  : matches?.status == 6
                      ? "FT"
                      : matches?.status == 1
                          ? getTime(matches?.start.toString() ?? "")
                          : matches?.statusTxt ?? "",
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        CustomText(text: '${matches?.teams?[0].name}'),
                      ],
                    ),
                    CustomText(
                      text: matches?.status == 1
                          ? '-'
                          : "${matches?.score?[0].toString()}",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        CustomText(text: '${matches?.teams?[1].name}')
                      ],
                    ),
                    CustomText(
                        text: matches?.status == 1
                            ? '-'
                            : "${matches?.score?[1].toString()}"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
