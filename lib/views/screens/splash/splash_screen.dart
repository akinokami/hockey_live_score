import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hockey_live_score/controller/splash_controller.dart';
import 'package:hockey_live_score/views/widgets/custom_loading.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';
import '../../../utils/dimen_const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/launcher.webp", width: 0.5.sw),
            kSizedBoxH30,
            kSizedBoxH30,
            const CustomLoading()
          ],
        ),
      ),
    );
  }
}
