import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/common/widgets/button_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/auth/login/otp_controller.dart';
import 'package:taskdone/views/profile/create_profile_screen.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen({super.key, required this.phone});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OTPController controller = Get.put(OTPController());
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
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
              SizedBox(height: 30.h),
              Center(
                child: Text(
                  AppLabels.enterCode,
                  style: AppTextStyle.semiboldPurplr25,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 2.h),
              Center(
                child: Text(
                  AppLabels.weSentYouCodeVieSms + widget.phone,
                  style: AppTextStyle.regularblack15,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 3.h),
              PinCodeTextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                appContext: context,
                pastedTextStyle: AppTextStyle.regularblack17,
                length: 6,
                obscureText: true,
                animationType: AnimationType.fade,
                autoFocus: false,
                validator: (v) {
                  if (v!.length < 6) {
                    return null;
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  activeBoxShadow: [
                    BoxShadow(
                      color: AppColors.boxShadow,
                      blurRadius: 7,
                      offset: Offset(0, 6),
                    ),
                  ],
                  inActiveBoxShadow: [
                    BoxShadow(
                      color: AppColors.boxShadow,
                      blurRadius: 7,
                      offset: Offset(0, 6),
                    ),
                  ],
                  selectedColor: AppColors.grey,
                  errorBorderColor: AppColors.red,
                  selectedFillColor: AppColors.grey,
                  activeColor: AppColors.white,
                  inactiveColor: controller.error.value != ''
                      ? Colors.red
                      : controller.validOTP.value == false
                          ? AppColors.grey
                          : AppColors.red,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(1.0.h),
                  fieldHeight: 6.0.h,
                  fieldWidth: 12.0.w,
                  activeFillColor: AppColors.grey,
                  inactiveFillColor: AppColors.grey,
                ),
                cursorColor: Colors.white,
                animationDuration: const Duration(milliseconds: 300),
                textStyle: AppTextStyle.regularblack17,
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: otpController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onCompleted: (otpCode) async {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    controller.otpCode.value = otpCode;
                  });
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return false;
                },
              ),
              const Spacer(),
              Center(
                child: ButtonWidget(
                  buttonText: AppLabels.done,
                  onPress: () {
                    Get.to(() => ProfileCreateScreen());
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
    );
  }
}
