import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/common/widgets/button_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/auth/onboarding/onboarding_screen.dart';
import 'package:taskdone/views/auth/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final splashScreenController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001838),
      body: Container(
        height: 100.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImagesPath.splash),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
              width: 75.w,
              child: Image.asset(
                AppImagesPath.splashTaskDone,
              ),
            ),
            SizedBox(
              width: 85.w,
              child: Text(
                AppLabels.findProfessionalService,
                style: AppTextStyle.regularWhite17,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            ButtonWidget(
              buttonText: AppLabels.continu,
              onPress: () {
                Get.offAll(()=>OnBoardingScreen());
              },
              color: AppColors.white,
              textStyle: AppTextStyle.regularblack17,
            ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}
