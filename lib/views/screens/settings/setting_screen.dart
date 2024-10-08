import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hockey_live_score/utils/color_const.dart';
import 'package:hockey_live_score/views/screens/settings/change_language.dart';
import 'package:get/get.dart';

import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';
import 'privacy_policy_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,

          centerTitle: true,
          title: CustomText(
            text: 'settings'.tr,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.w),
          child: ListView(
            children: [
              CustomText(text: 'general'.tr),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ChangeLanguageScreen());
                },
                child: CustomCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 18.sp,
                            color: secondaryColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'language'.tr)
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: 'lang'.tr,
                            fontSize: 12.sp,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18.sp,
                            color: secondaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Obx(
              //   () => Switch(
              //     value: settingController.currentTheme.value == ThemeMode.dark,
              //     onChanged: (value) {
              //       settingController.switchTheme();
              //       Get.changeThemeMode(settingController.currentTheme.value);
              //     },
              //     activeColor: CustomTheme.white,
              //   ),
              // ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(text: 'other'.tr),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const PrivacyPolicyScreen());
                },
                child: CustomCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.policy_outlined,
                            size: 18.sp,
                            color: secondaryColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(text: 'policy'.tr)
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18.sp,
                        color: secondaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              CustomCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 18.sp,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(text: 'version'.tr),
                      ],
                    ),
                    const CustomText(text: '1.0.0'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
