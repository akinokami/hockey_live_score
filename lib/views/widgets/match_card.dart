import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hockey_live_score/views/widgets/custom_text.dart';

import '../../utils/color_const.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
      },
      child: Row(
        children: [
          SizedBox(
            width: 1.sw * 0.10,
            child: Icon(
              Icons.circle,
              color: secondaryColor,
              size: 10.sp,
            ),
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
                    CustomText(text: 'Home Team')
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
                    CustomText(text: 'Away Team')
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
