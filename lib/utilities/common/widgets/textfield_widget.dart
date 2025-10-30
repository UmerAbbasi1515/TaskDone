import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class TextFiledWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFiledWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey, // light grey background
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.6.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.boxShadow, // border color
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors
                .boxShadow, // same color when focused (you can make it blue if preferred)
            width: 1.5,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
