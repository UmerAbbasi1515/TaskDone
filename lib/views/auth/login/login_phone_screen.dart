import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/common/widgets/button_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/auth/login/login_controller.dart';
import 'package:taskdone/views/auth/login/otp_screen.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  LoginController controller = Get.put(LoginController());

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
                  AppLabels.joinUseViewPhone,
                  style: AppTextStyle.semiboldPurplr25,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 2.h),
              Center(
                child: Text(
                  AppLabels.verifyyourPhone,
                  style: AppTextStyle.regularblack15,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 3.h),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (code) {
                        if (kDebugMode) {
                          print(code);
                        }
                        controller.countryCode.value = code.toString();
                      },
                      initialSelection: 'Pk',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          // Allow only digits (0-9)
                          FilteringTextInputFormatter.digitsOnly,
                          // Optionally limit length
                          // LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppLabels.enterPhoneNumber,
                          hintStyle: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: ButtonWidget(
                  buttonText: AppLabels.next,
                  onPress: () {
                    if (controller.phoneController.text == "") {
                      Get.snackbar("Error", "Please enter phone number");
                      return;
                    }
                    var mobileNumber = controller.countryCode.value +
                        controller.phoneController.text;
                    Get.to(() => OTPScreen(
                          phone: mobileNumber,
                        ));
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
