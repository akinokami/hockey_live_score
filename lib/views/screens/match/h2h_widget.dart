import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hockey_live_score/controller/match_controller.dart';
import 'package:hockey_live_score/models/h2h_model.dart';
import 'package:hockey_live_score/utils/color_const.dart';
import 'package:hockey_live_score/utils/dimen_const.dart';
import 'package:hockey_live_score/utils/function.dart';
import 'package:hockey_live_score/views/widgets/custom_text.dart';

class H2HWidget extends StatelessWidget {
  const H2HWidget({super.key, this.h2hData});
  final H2HModel? h2hData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.builder(
                itemCount: h2hData?.h2H?.matches?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: cardColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
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
                              CustomText(
                                  text:
                                      "${h2hData?.h2H?.matches?[index].cName ?? ""} : ${h2hData?.h2H?.matches?[index].stName ?? ""}"),
                              CustomText(
                                  text: (h2hData?.h2H?.matches?[index].season ??
                                      "")),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          // color: cardColor.withOpacity(0.8),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: getDate(h2hData
                                        ?.h2H?.matches?[index].start
                                        .toString() ??
                                    ""),
                                fontSize: 12.sp,
                              ),
                              kSizedBoxW5,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          child: Row(
                                            children: [
                                              Icon(
                                                size:10,
                                                Icons.sports_hockey_outlined,
                                                color: secondaryColor,
                                              ),
                                              CustomText(
                                                  text: h2hData
                                                          ?.h2H
                                                          ?.matches?[index]
                                                          .teams?[0]
                                                          .name ??
                                                      ""),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50.w,
                                          child: CustomText(
                                              textAlign: TextAlign.right,
                                              text: h2hData
                                                      ?.h2H
                                                      ?.matches?[index]
                                                      .score?[0]
                                                      .toString() ??
                                                  ""),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          child: Row(
                                            children: [
                                              Icon(
                                                size:10.w,
                                                Icons.sports_hockey_outlined,
                                                color: whiteColor,
                                              ),
                                              CustomText(
                                                  text: h2hData
                                                          ?.h2H
                                                          ?.matches?[index]
                                                          .teams?[1]
                                                          .name ??
                                                      ""),
                                            ],
                                          ),
                                        ),
                                        kSizedBoxW5,
                                        SizedBox(
                                          width: 50.w,
                                          child: CustomText(
                                              textAlign: TextAlign.right,
                                              text: h2hData
                                                      ?.h2H
                                                      ?.matches?[index]
                                                      .score?[1]
                                                      .toString() ??
                                                  ""),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
  }
}
