import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moru_digital_task/app/constants/constants.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final storage= GetStorage();
  runApp(
    GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        title: "Application",
        debugShowCheckedModeBanner: false,
        initialRoute: storage.read(Constants.IS_FIRST_TIME)?AppPages.INITIAL:Routes.HOME,
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.black,
            foregroundColor: Colors.white, //title text color
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
          ),
        ),
      ),
    ),
  );
}
