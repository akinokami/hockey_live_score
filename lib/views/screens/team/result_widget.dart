import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/match_card.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.sports_hockey,
                size: 18.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              const CustomText(text: 'KHL')
            ],
          ),
          kSizedBoxH5,
          Divider(height: 1.h, color: grey.withOpacity(0.3)),
          kSizedBoxH5,
          const MatchCard(),
        ],
      ),
    );
  }
}
