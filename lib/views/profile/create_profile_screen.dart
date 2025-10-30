import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/common/widgets/button_widget.dart';
import 'package:taskdone/utilities/common/widgets/label_widget.dart';
import 'package:taskdone/utilities/common/widgets/textfield_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/profile/profile_controller.dart';
import 'package:taskdone/views/wallet/connect_wallet_screen.dart';

class ProfileCreateScreen extends StatefulWidget {
  const ProfileCreateScreen({super.key});

  @override
  State<ProfileCreateScreen> createState() => _ProfileCreateScreenState();
}

class _ProfileCreateScreenState extends State<ProfileCreateScreen> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      AppImagesPath.back,
                      height: 2.h,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Center(
                    child: Text(
                      AppLabels.completeYourPosterProfile,
                      style: AppTextStyle.semiboldPurplr20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.h),
                  Center(
                    child: Text(
                      AppLabels.completeYourDetailsToStart,
                      style: AppTextStyle.regularblack15,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppImagesPath.profile,
                        height: 15.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  LabelWidget(title: AppLabels.fullName),
                  SizedBox(height: 0.5.h),
                  TextFiledWidget(
                    controller: controller.fullNameController,
                    hintText: AppLabels.enterFullName,
                  ),
                  SizedBox(height: 2.h),
                  LabelWidget(title: AppLabels.phoneNumber),
                  SizedBox(height: 0.5.h),
                  TextFiledWidget(
                    controller: controller.phoneNumberController,
                    hintText: AppLabels.enterPhoneNumber,
                  ),
                  SizedBox(height: 2.h),
                  LabelWidget(title: AppLabels.emailAddress),
                  SizedBox(height: 0.5.h),
                  TextFiledWidget(
                    controller: controller.emailAddressController,
                    hintText: AppLabels.enterEmailAddress,
                  ),
                  SizedBox(height: 2.h),
                  LabelWidget(title: AppLabels.location),
                  SizedBox(height: 0.5.h),
                  TextFiledWidget(
                    controller: controller.locationController,
                    hintText: AppLabels.enterLocation,
                  ),
                  SizedBox(height: 0.5.h),
                  Obx(() {
                    return Row(
                      children: [
                        Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (val) {
                              controller.isChecked.value = val ?? false;
                            }),
                        Text(
                          AppLabels.iAgreeTo,
                          style: AppTextStyle.normalGrey15,
                        ),
                        Text(AppLabels.termAndPrivacyPolicy,
                            style: AppTextStyle.normalGrey15
                                .copyWith(color: AppColors.blue)),
                      ],
                    );
                  }),
                  SizedBox(height: 2.5.h),
                  Center(
                    child: ButtonWidget(
                      buttonText: AppLabels.done,
                      onPress: () {
                        Get.to(() => ConnectWalletScreen());
                      },
                      color: AppColors.purple,
                      textStyle: AppTextStyle.regularWhite18,
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
