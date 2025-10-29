import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString phoneNumber = ''.obs;
  RxString countryCode = ''.obs;
  RxString otpCode = ''.obs;
  final TextEditingController phoneController = TextEditingController();
}
