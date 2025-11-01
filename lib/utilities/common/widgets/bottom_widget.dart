// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/styles/colors.dart';

class CustomNavBar extends StatelessWidget {
  final List<Widget>? items;
  const CustomNavBar({
    super.key,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(top: 1.0.h, bottom: 0.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow,
            blurRadius: 0.5.h,
            spreadRadius: 0.0.h,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items!,
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final Function(int)? onTap;
  final int? position;
  final String? title;
  final String? icon;
  final TextStyle? style;
  const NavBarItem({
    super.key,
    @required this.onTap,
    @required this.position,
    @required this.title,
    @required this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!(position!);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon!,
            height: 3.h,
            width: 3.h,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 0.2.h,
          ),
          Text(
            title!,
            style: style,
          )
        ],
      ),
    );
  }
}
