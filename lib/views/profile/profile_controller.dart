import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  RxBool isChecked = false.obs;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
}