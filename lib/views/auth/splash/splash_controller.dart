import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  bool isLoginBool = false;
  RxString phone = "".obs;

  @override
  Future<void> onInit() async {
    if (kDebugMode) {
      print("Hello");
    }
    await Future.delayed(Duration(seconds: 2));
    super.onInit();
  }
}
