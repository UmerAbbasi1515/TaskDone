import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:taskdone/data/helpers/base_client.dart';
import 'package:taskdone/utilities/common/widgets/button_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';

// ignore: must_be_immutable
class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            // const AppBackgroundImage(),
            SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 9.0.h),
                        child: const SizedBox(),
                        // child: const AppLogoCollier(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Image.asset(
                          AppImagesPath.logo,
                          width: 45.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(AppLabels().noInternetConnection,
                            style: AppTextStyle.semiBoldWhite14),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0.h),
                          child: ButtonWidget(
                            buttonText: AppLabels().retry,
                            onPress: () async {
                              bool isInternetConnected =
                                  await BaseClientClass.isInternetConnected();
                              if (isInternetConnected) {
                                Get.back(result: true);
                              }
                            },
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
