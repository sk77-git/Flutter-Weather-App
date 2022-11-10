import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moru_digital_task/app/constants/constants.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';
import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  HelpView({super.key});

  @override
  final controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
         height: height,
         width: width,
         decoration: const BoxDecoration(
           image: DecorationImage(image: AssetImage(AppImages.bg),fit: BoxFit.cover)
         ),
        child: Column(
          children: [
            SizedBox(height: height/2,),
            AppText(text: "We provide weather for you.",textColor: AppColors.onPrimary,size: AppDimens.MEDIUM, fontWeight: FontWeight.bold,),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 20, left: 50,right: 50),
              child: InkWell(onTap: (){
                Get.offAllNamed(Routes.HOME);
              },child: AppButton(title: "Get Started",isFullWidth: true,bgColor: AppColors.secondary,titleColor: AppColors.grey,)),
            ),
          ],
        ),
      ),
    );
  }
}
