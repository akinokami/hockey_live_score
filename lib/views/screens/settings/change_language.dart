import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/language_controller.dart';
import '../../../utils/color_const.dart';
import '../../../utils/enum.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_text.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: CustomText(
          text: 'change_language'.tr,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("en", "US");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/usa.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "English",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value ==
                                    Language.en.name
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value ==
                                    Language.en.name
                                ? secondaryColor
                                : grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                      () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("zh", "CN");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/china.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "中國人",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value ==
                                Language.zh.name
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value ==
                                Language.zh.name
                                ? secondaryColor
                                : grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("vi", "VN");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/vietnam.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "Tiếng Việt",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value ==
                                    Language.vi.name
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value ==
                                    Language.vi.name
                                ? secondaryColor
                                : grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      languageController.changeLanguage("hi", "IN");
                    },
                    child: CustomCard(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/india.webp",
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const CustomText(
                                text: "हिन्दी",
                              )
                            ],
                          ),
                          Icon(
                            languageController.language.value ==
                                    Language.hi.name
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: languageController.language.value ==
                                    Language.hi.name
                                ? secondaryColor
                                : grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
