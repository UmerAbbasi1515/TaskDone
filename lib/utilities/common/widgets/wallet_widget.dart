import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';

class AddedWalletWidget extends StatelessWidget {
  final String image;
  final String title;
  final String accountHolder;
  final String accountNumber;
  const AddedWalletWidget({
    super.key,
    required this.image,
    required this.title,
    required this.accountHolder,
    required this.accountNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 2.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 7.h,
            width: 7.h,
          ),
          SizedBox(width: 4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.mediumblack18,
              ),
              SizedBox(
                width: 60.w,
                child: Text(
                  accountHolder,
                  style: AppTextStyle.regularblack15,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                width: 60.w,
                child: Text(
                  accountNumber,
                  style: AppTextStyle.regularblack15,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AvailableWalletWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String selectedWallet;
  const AvailableWalletWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.selectedWallet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, left: 10, right: 10),
      decoration: BoxDecoration(
        color: selectedWallet.toLowerCase() == title.toLowerCase()
            ? AppColors.veryLightPurple
            : AppColors.transparent,
        border: Border.all(
            color: selectedWallet.toLowerCase() == title.toLowerCase()
                ? AppColors.purple
                : AppColors.lightGrey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 7.h,
            width: 7.h,
          ),
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.mediumblack18,
              ),
              SizedBox(
                width: 38.w,
                child: Text(
                  description,
                  style: AppTextStyle.regularblack15,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
