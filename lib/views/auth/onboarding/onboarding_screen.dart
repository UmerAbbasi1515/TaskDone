import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/auth/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  // 🟢 Data for 3 onboarding screens
  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": AppLabels.postTaskEasily,
      "image": AppImagesPath.onboarding1,
      "desc": AppLabels.findProfessionalService,
    },
    {
      "title": AppLabels.earnLocallyAsFreeLancer,
      "image": AppImagesPath.onboarding2,
      "desc": AppLabels.findProfessionalService,
    },
    {
      "title": AppLabels.safePaymentMethod,
      "image": AppImagesPath.onboarding3,
      "desc": AppLabels.findProfessionalService,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(
                        () => isLastPage = index == onboardingData.length - 1);
                  },
                  itemBuilder: (context, index) {
                    final data = onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data["title"],
                          style: AppTextStyle.semiboldPurplr25,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(height: 3.h),
                        Image.asset(data["image"], height: 30.h),
                        SizedBox(height: 3.h),
                        SizedBox(
                          width: 80.w,
                          child: Text(
                            data["desc"],
                            style: AppTextStyle.regularblack17,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 2.h),

              // 🔵 Page indicator – no fixed height!
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  if (isLastPage == true)
                    SizedBox(
                      width: 20.w,
                    ),
                  if (isLastPage != true)
                    SizedBox(
                      width: 10.w,
                    ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: onboardingData.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.purple,
                      dotColor: AppColors.lightPurple,
                      dotHeight: 1.h,
                      dotWidth: 2.w,
                      spacing: 2.w,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (isLastPage) {
                        Get.offAll(() => LoginScreen());
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      isLastPage == true ? AppLabels.continu : AppLabels.next,
                      style: AppTextStyle.regularblack17,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
