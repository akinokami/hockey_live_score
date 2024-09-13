import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hockey_live_score/models/match_model.dart';
import 'package:hockey_live_score/views/widgets/custom_text.dart';

import '../../utils/color_const.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key, this.matches,
  });
final Matches? matches;


  @override
  Widget build(BuildContext context) {
    var time=matches?.start.toString().substring(8);
    var formatTime1=time?.split("")[0];
    var formatTime2=time?.split("")[1];
    var formatTime3=time?.split("")[2];
    var formatTime4=time?.split("")[3];
    var formattedTime="$formatTime1$formatTime2:$formatTime3$formatTime4";
    return InkWell(
      onTap: () {
        //
      },
      child: Row(
        children: [
          SizedBox(
            width: 1.sw * 0.15,
            child: CustomText(text:matches?.status==1? (formattedTime): matches?.statusTxt??"",),
          ),
          Expanded(
            child: Column(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
