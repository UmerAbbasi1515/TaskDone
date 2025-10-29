
import 'package:get/get.dart';

class OTPController extends GetxController {
  RxString otpCode = ''.obs;
  RxString error = ''.obs;
  RxBool validOTP = false.obs;
}
