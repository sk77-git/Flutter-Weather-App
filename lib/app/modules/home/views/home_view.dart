import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: (){
          return Future(() => controller.onInit());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.bg),fit: BoxFit.cover)
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                children: [
                  /*=====================Custom Appbar====================*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: "Weather App", textColor: AppColors.onPrimary,size: AppDimens.MEDIUM,fontWeight: FontWeight.bold,),
                      IconButton(onPressed: (){
                        Get.toNamed(Routes.HELP);
                      }, icon: const Icon(Icons.help, color: AppColors.onPrimary,size: 30,)),
                    ],
                  ),
                  /*=====================Searchbar====================*/
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: controller.searchTextFieldController,
                    style: const TextStyle(color: AppColors.onPrimary),
                    onChanged: (value) {
                      log(value.toString());
                      controller.getWeather(value.toString());
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      fillColor: Colors.transparent,
                      filled: true,
                      labelText: 'Search Location',
                      labelStyle: TextStyle(color: AppColors.whiteGrey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.onPrimary, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.onPrimary, width: 1),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  /*=====================Save/Update Button====================*/
                  const SizedBox(height: 20,),
                  Obx(() => InkWell(onTap: (){
                    controller.onSavePressed();
                  },child: AppButton(title: controller.isLocationSaved.value?"Update":"Save")),),
                  /*=====================Weather Widget====================*/
                  const SizedBox(height: 20,),
                  Obx(() => controller.isLoading.value?const CircularProgressIndicator():Container(
                    padding: const EdgeInsets.all(20),
                    height: height/4,
                    decoration: BoxDecoration(
                        color: AppColors.onPrimary.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*=========Row One: For Date =============*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "${controller.weatherResponse[0].current?.condition?.text}", size: AppDimens.MEDIUM, fontWeight: FontWeight.bold, textColor: AppColors.onPrimary,),
                            AppText(text: "${controller.weatherResponse[0].current?.lastUpdated}", textColor: AppColors.whiteGrey,)
                          ],
                        ),
                        /*=========Row Two: For Temperature and Icon==========*/
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(text: "${controller.weatherResponse[0].current?.tempC}", size: 50, textColor: AppColors.onPrimary,),
                                AppText(text: "°C", size: 30, textColor: AppColors.secondary,fontWeight: FontWeight.bold,),                      ],
                            ),
                            SizedBox(
                                width: 70,
                                child: Image.network("https:${controller.weatherResponse[0].current?.condition?.icon}")),
                          ],
                        ),
                        /*=========Row Three: For Location Text============*/
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: AppColors.secondary,size: 16,),
                            const SizedBox(width: 5,),
                            AppText(text: "${controller.weatherResponse[0].location?.name}", textColor: AppColors.onPrimary, fontWeight: FontWeight.w500,)
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
