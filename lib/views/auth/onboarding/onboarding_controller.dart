import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() {
     if(kDebugMode) print("Onboarding Controller");
    super.onInit();
  }
}
