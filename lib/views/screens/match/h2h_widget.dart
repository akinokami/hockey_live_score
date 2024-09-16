import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hockey_live_score/utils/color_const.dart';
import 'package:hockey_live_score/views/widgets/custom_text.dart';

class H2HWidget extends StatelessWidget {
  const H2HWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
          decoration: BoxDecoration(
            color: cardColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
                    CustomText(text: "Match Name"),
                    CustomText(text: "Match Date"),
                  ],
                ),
              ),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            // color: cardColor.withOpacity(0.8),
             child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.sports_hockey_outlined),
                           CustomText(text: "Team 1"),

                         ],
                       ),
                       CustomText(text: "2")
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.sports_hockey_outlined),
                           CustomText(text: "Team 1"),

                         ],
                       ),
                       CustomText(text: "2")
                     ],
                   )
                 ],
             ),
           )
            ],
          ),
        )
      ],
    );
  }
}
