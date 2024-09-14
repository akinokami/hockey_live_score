import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/models/team_model.dart';
import 'package:hockey_live_score/views/widgets/custom_card.dart';
import 'package:hockey_live_score/views/widgets/custom_text.dart';

import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';

class SquardWidget extends StatelessWidget {
  final List<Participants>? participants;
  const SquardWidget({super.key, this.participants});

  @override
  Widget build(BuildContext context) {
    return (participants ?? []).isEmpty
        ? Center(
            child: CustomText(text: 'no_data'.tr),
          )
        : CustomCard(
            widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'player'.tr),
              kSizedBoxH5,
              Divider(height: 1.h, color: grey.withOpacity(0.3)),
              kSizedBoxH5,
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: participants?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 22.sp,
                              color: secondaryColor,
                            ),
                            kSizedBoxW10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: participants?[index].name ?? ''),
                                CustomText(
                                  text: participants?[index].cname ?? '',
                                  fontSize: 11.sp,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ));
  }
}
