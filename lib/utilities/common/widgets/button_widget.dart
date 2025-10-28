// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String? buttonText;

  const ButtonWidget({super.key, this.buttonText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.0.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.3.h),
          ),
          backgroundColor: AppColors.whiteColor,
          padding: EdgeInsets.symmetric(horizontal: 6.0.h, vertical: 1.5.h),
          // textStyle: AppTextStyle.buttonTextStyle,
        ),
        onPressed: onPress,
        child: Text(
          buttonText ?? "",
          style: AppTextStyle.buttonTextStyle,
        ),
      ),
    );
  }
}

class ButtonWidgetBlue extends StatelessWidget {
  final VoidCallback? onPress;
  final String? buttonText;

  const ButtonWidgetBlue({super.key, this.buttonText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.0.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.3.h),
          ),
          backgroundColor: AppColors.blueColor,
          padding: EdgeInsets.symmetric(horizontal: 6.0.h, vertical: 1.5.h),
          // textStyle: AppTextStyle.buttonTextStyle,
        ),
        onPressed: onPress,
        child: Text(
          buttonText ?? "",
          style: AppTextStyle.buttonTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
