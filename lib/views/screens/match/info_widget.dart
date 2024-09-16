import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/models/match_model.dart';
import 'package:hockey_live_score/utils/color_const.dart';
import 'package:hockey_live_score/utils/dimen_const.dart';
import 'package:hockey_live_score/views/widgets/custom_text.dart';


class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.matches,});
  final Matches? matches;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.w),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: CustomText(text: "score".tr),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                          child: CustomText(
                        text: "P1",
                      )),
                      Center(
                          child: CustomText(
                        text: "P2",
                      )),
                      Center(
                          child: CustomText(
                        text: "P3",
                      )),
                      Center(
                          child: CustomText(
                        text: "OT",
                      )),
                      Center(
                          child: CustomText(
                        text: "SO",
                      )),
                      Center(
                          child: CustomText(
                        text: "T",
                      )),
                    ],
                  ))
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: CustomText(
                      text: matches?.teams?[0].name ?? "",
                      maxLines: 3,
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ((matches?.l1pScore?.length ?? 0) > 0)
                          ?  Center(
                          child: CustomText(
                            text: (matches?.l1pScore?[0].toString() ?? "0")
                            ,
                          )):const Center(child: CustomText(text: "0")),
                      ((matches?.l2pScore?.length ?? 0) > 0)
                          ?  Center(
                          child: CustomText(
                            text: (matches?.l2pScore?[0].toString() ?? "0")
                            ,
                          )):const Center(child: CustomText(text: "0")),
                      ((matches?.l3pScore?.length ?? 0) > 0)
                          ?  Center(
                          child: CustomText(
                        text: (matches?.l3pScore?[0].toString() ?? "0")
                            ,
                      )):const Center(child: CustomText(text: "0")),
                      ((matches?.lOScore?.length ?? 0) > 0)
                          ?  Center(
                          child: CustomText(
                            text: (matches?.lOScore?[0].toString() ?? "0")
                            ,
                          )):const Center(child: CustomText(text: "0")),
                      ((matches?.lPenScore?.length ?? 0) > 0)
                          ?  Center(
                          child: CustomText(
                            text: (matches?.lPenScore?[0].toString() ?? "0")
                            ,
                          )):const Center(child: CustomText(text: "0")),
                      ((matches?.score?.length ?? 0) > 0)
                          ?  Center(
                          child: CustomText(
                            text: (matches?.score?[0].toString() ?? "0")
                            ,
                          )):const Center(child: CustomText(text: "0")),
                    ],
                  ))
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: CustomText(
                      text: matches?.teams?[1].name ?? "",
                      maxLines: 3,
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                          child: CustomText(
                        text: ((matches?.l1pScore?.length ?? 0) > 0)
                            ? (matches?.l1pScore?[1].toString() ?? "0")
                            : "0",
                      )),
                      Center(
                          child: CustomText(
                        text: ((matches?.l2pScore?.length ?? 0) > 0)
                            ? (matches?.l2pScore?[1].toString() ?? "0")
                            : "0",
                      )),
                      Center(
                          child: CustomText(
                        text: ((matches?.l3pScore?.length ?? 0) > 0)
                            ? (matches?.l3pScore?[1].toString() ?? "0")
                            : "0",
                      )),
                      Center(
                          child: CustomText(
                        text: ((matches?.lOScore?.length ?? 0) > 0)
                            ? (matches?.lOScore?[1].toString() ?? "0")
                            : "0",
                      )),
                      Center(
                          child: CustomText(
                        text: ((matches?.lPenScore?.length ?? 0) > 0)
                            ? (matches?.lPenScore?[1].toString() ?? "0")
                            : "0",
                      )),
                      Center(
                          child: CustomText(
                        text: ((matches?.score?.length ?? 0) > 0)
                            ? (matches?.score?[1].toString() ?? "0")
                            : "0",
                      )),
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
        kSizedBoxH20,

      ],
    );
  }
}
