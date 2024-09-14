import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hockey_live_score/models/match_model.dart';

import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/match_card.dart';

class UpcomingWidget extends StatelessWidget {
  final List<Matches>? matches;
  const UpcomingWidget({super.key, this.matches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matches?.length,
      itemBuilder: (context, index) {
        return CustomCard(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: matches?[index].cName ?? ''),
              kSizedBoxH5,
              Divider(height: 1.h, color: grey.withOpacity(0.3)),
              kSizedBoxH5,
              MatchCard(
                matches: matches?[index],
              )
            ],
          ),
        );
      },
    );
  }
}
