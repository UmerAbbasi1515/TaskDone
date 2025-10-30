import 'package:flutter/material.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';

class LabelWidget extends StatelessWidget {
  final String title;
  const LabelWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.mediumblack18,
    );
  }
}
