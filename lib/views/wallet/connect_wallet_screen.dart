import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskdone/utilities/common/widgets/wallet_widget.dart';
import 'package:taskdone/utilities/common/widgets/button_widget.dart';
import 'package:taskdone/utilities/common/widgets/label_widget.dart';
import 'package:taskdone/utilities/common/widgets/textfield_widget.dart';
import 'package:taskdone/utilities/constants/assets_path.dart';
import 'package:taskdone/utilities/constants/meta_labels.dart';
import 'package:taskdone/utilities/styles/colors.dart';
import 'package:taskdone/utilities/styles/text_styles.dart';
import 'package:taskdone/views/home/dashoard_screen.dart';
import 'package:taskdone/views/wallet/connect_wallet_controller.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({super.key});

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> {
  ConnectWalletController controller = Get.put(ConnectWalletController());
  void linkNewWallet(
      String title, String accountHolder, String accountNumber) async {
    String image = "";
    if (title.toLowerCase() == "easypaisa") {
      image = AppImagesPath.easypaisa;
    } else {
      image = AppImagesPath.jasscash;
    }
    setState(() {
      controller.wallets.add(WalletModel(
          image: image,
          title: title,
          accountHolder: accountHolder,
          accountNumber: accountNumber));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          child: SingleChildScrollView(
              child: SizedBox(
            // height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AppImagesPath.back,
                    height: 2.h,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  AppLabels.connectYourWallet,
                  style: AppTextStyle.semiboldPurplr20,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3.h),
                LabelWidget(title: AppLabels.linkedAccount),
                Text(
                  AppLabels.chooseYourPrefferedPayment,
                  style: AppTextStyle.regularblack17,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  height: 56.h,
                  child: Obx(() {
                    return controller.tempVar.value
                        ? SizedBox()
                        : ListView.builder(
                            itemCount: controller.wallets.length + 1,
                            itemBuilder: (context, index) {
                              if (index == controller.wallets.length) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.selectedWallet.value = "";
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        content: UnconstrainedBox(
                                          constrainedAxis: Axis.horizontal,
                                          child: SizedBox(
                                            width: 95.w,
                                            child: buildLinkWalletPopup(
                                                context, controller),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add,
                                            size: 8.h, color: Colors.grey),
                                        SizedBox(width: 1.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppLabels.linkNewWallet,
                                              style: AppTextStyle.mediumblack18,
                                            ),
                                            SizedBox(height: 4),
                                            SizedBox(
                                              width: 60.w,
                                              child: Text(
                                                AppLabels
                                                    .receiveYourEarningdirectly,
                                                style:
                                                    AppTextStyle.regularblack15,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              // Existing wallet cards
                              return AddedWalletWidget(
                                image: controller.wallets[index].image ?? "",
                                title: controller.wallets[index].title ?? "",
                                accountHolder:
                                    controller.wallets[index].accountHolder ??
                                        "",
                                accountNumber:
                                    controller.wallets[index].accountNumber ??
                                        "",
                              );
                            },
                          );
                  }),
                ),
                SizedBox(height: 2.h),
                Center(
                  child: ButtonWidget(
                    buttonText: AppLabels.next,
                    onPress: () {
                      Get.offAll(() => DashboardSreen());
                    },
                    color: AppColors.purple,
                    textStyle: AppTextStyle.regularWhite18,
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

Widget buildLinkWalletPopup(
    BuildContext context, ConnectWalletController controller) {
  return SingleChildScrollView(
    child: Obx(() {
      return SizedBox(
        height: 38.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Center(
              child: Text(
                AppLabels.connectYourWallet,
                style: AppTextStyle.semiboldPurplr20,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.selectedWallet.value =
                          controller.availableWallets[index].title ?? "";
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: AvailableWalletWidget(
                        selectedWallet:
                            controller.selectedWallet.value.toString(),
                        image: controller.availableWallets[index].image ?? "",
                        title: controller.availableWallets[index].title ?? "",
                        description: AppLabels.receiveYourEarningdirectly,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 1.h),
            Center(
              child: SizedBox(
                height: 6.h,
                width: 40.w,
                child: ButtonWidget(
                  buttonText: AppLabels.done,
                  onPress: controller.selectedWallet.value == ""
                      ? null
                      : () {
                          Navigator.pop(context);
                          controller.fullname.value = "";
                          controller.phoneNumber.value = "";
                          controller.nameController.text = "";
                          controller.phoneNumberController.text = "";
                          final existing = controller.wallets.firstWhereOrNull(
                            (w) =>
                                w.title?.toLowerCase() ==
                                controller.selectedWallet.value.toLowerCase(),
                          );

                          if (existing == null) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: EdgeInsets.all(16),
                                content: LinkWalletDetailPopup(
                                  controller: controller,
                                  selectedWallet:
                                      controller.selectedWallet.value,
                                ),
                              ),
                            );
                          } else {
                            Get.snackbar("Error", "Already exist");
                          }
                        },
                  color: AppColors.purple,
                  textStyle: AppTextStyle.regularWhite17,
                ),
              ),
            )
          ],
        ),
      );
    }),
  );
}

class LinkWalletDetailPopup extends StatefulWidget {
  final ConnectWalletController controller;
  final String selectedWallet;

  const LinkWalletDetailPopup({
    super.key,
    required this.controller,
    required this.selectedWallet,
  });

  @override
  State<LinkWalletDetailPopup> createState() => _LinkWalletDetailPopupState();
}

class _LinkWalletDetailPopupState extends State<LinkWalletDetailPopup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return SingleChildScrollView(
      child: Obx(() {
        return SizedBox(
          height: 38.h,
          width: 90.w,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 0.5.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Center(
                  child: Text(
                    AppLabels.connectYourWallet,
                    style: AppTextStyle.semiboldPurplr20,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 2.h),
                LabelWidget(title: AppLabels.fullName),
                TextFiledWidget(
                  controller: controller.nameController,
                  hintText: AppLabels.enterFullName,
                  onChanged: (val) => controller.fullname.value = val,
                  onCompleted: () => controller.fullname.value =
                      controller.nameController.text,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 1.h),
                LabelWidget(title: AppLabels.phoneNumber),
                TextFiledWidget(
                  controller: controller.phoneNumberController,
                  hintText: AppLabels.enterPhoneNumber,
                  onChanged: (val) => controller.phoneNumber.value = val,
                  onCompleted: () => controller.phoneNumber.value =
                      controller.phoneNumberController.text,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 2.h),
                Center(
                  child: SizedBox(
                    height: 6.h,
                    width: 40.w,
                    child: ButtonWidget(
                      buttonText: AppLabels.done,
                      onPress: controller.fullname.value.isEmpty ||
                              controller.phoneNumber.value.isEmpty
                          ? null
                          : () {
                              controller.wallets.add(
                                WalletModel(
                                  image: controller.selectedWallet.value
                                              .toLowerCase() ==
                                          "easypaisa"
                                      ? AppImagesPath.easypaisa
                                      : AppImagesPath.jasscash,
                                  title: controller.selectedWallet.value,
                                  accountHolder: controller.fullname.value,
                                  accountNumber: controller.phoneNumber.value,
                                ),
                              );
                              Navigator.pop(context);
                            },
                      color: AppColors.purple,
                      textStyle: AppTextStyle.regularWhite17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
