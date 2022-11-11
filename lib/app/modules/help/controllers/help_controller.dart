import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moru_digital_task/app/routes/app_pages.dart';

import '../../../constants/constants.dart';

class HelpController extends GetxController {
  final storage= GetStorage();

  @override
  void onInit() {
    super.onInit();
    if (storage.read(Constants.IS_FIRST_TIME)==null) {
      delayAndGoToHome();
    }  else{
    }
  }

  @override
  void onReady() {
    log("HelpController:onReady");
    super.onReady();
  }

  @override
  void onClose() {}

  void delayAndGoToHome() {
    Future.delayed(const Duration(seconds: 5), () async {
      await Get.offAllNamed(Routes.HOME);
    });
    storage.write(Constants.IS_FIRST_TIME, false);
  }
}
