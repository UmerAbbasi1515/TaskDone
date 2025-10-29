import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/common/widgets/button_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/auth/login/login_phone_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 90.h,
            padding:
                EdgeInsets.only(left: 2.h, right: 2.h, bottom: 0.h, top: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 4.h),
                Text(
                  AppLabels.chooseHowYouWanttoContinue,
                  style: AppTextStyle.semiboldPurplr25.copyWith(height: 1.3),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 1.h),
                Text(
                  AppLabels.selectYourRoleToPersonilizeYourExperience,
                  style: AppTextStyle.regularblack17,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3.h),
                Center(
                  child: Image.asset(
                    AppImagesPath.login,
                  ),
                ),
                SizedBox(height: 5.h),
                ButtonWidget(
                  buttonText: AppLabels.continueWithPhone,
                  onPress: () {
                    Get.to(() => LoginPhoneScreen());
                  },
                  color: AppColors.purple,
                  textStyle: AppTextStyle.regularWhite18,
                ),
                SizedBox(height: 1.6.h),
                SizedBox(
                  width: 80.w,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImagesPath.google,
                      width: 2.4.h,
                    ),
                    label: Text(
                      AppLabels.continueWithGoogle,
                      style: AppTextStyle.regularblack15,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLabels.alreadyAccount,
                      style: AppTextStyle.regularblack15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        AppLabels.login,
                        style: AppTextStyle.semiBoldblue15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
