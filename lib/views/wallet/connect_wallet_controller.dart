import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';

class ConnectWalletController extends GetxController {
  RxBool tempVar = false.obs;
  RxString selectedWallet = "".obs;
  List<WalletModel> availableWallets = [
    WalletModel(image: AppImagesPath.easypaisa, title: AppLabels.easyPaisa),
    WalletModel(image: AppImagesPath.jasscash, title: AppLabels.jazzCash),
  ];
  final TextEditingController nameController = TextEditingController();
  final RxString fullname = ''.obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final RxString phoneNumber = ''.obs;

  RxList<WalletModel> wallets = <WalletModel>[].obs;
}

class WalletModel {
  WalletModel({
    this.image,
    this.title,
    this.accountHolder,
    this.accountNumber,
  });

  String? image;
  String? title;
  String? accountHolder;
  String? accountNumber;
}
