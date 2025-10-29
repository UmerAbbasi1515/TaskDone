// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String? buttonText;
  final Color? color;
  final TextStyle? textStyle;

  const ButtonWidget({super.key, this.buttonText, this.onPress, this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.0.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
        ),
        onPressed: onPress,
        child: Text(
          buttonText ?? "",
          style: textStyle,
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
          backgroundColor: AppColors.purple,
          padding: EdgeInsets.symmetric(horizontal: 6.0.h, vertical: 1.5.h),
          // textStyle: AppTextStyle.buttonTextStyle,
        ),
        onPressed: onPress,
        child: Text(
          buttonText ?? "",
          style: AppTextStyle.normalGrey8.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
