import 'package:get/get.dart';

import 'package:moru_digital_task/app/modules/help/bindings/help_binding.dart';
import 'package:moru_digital_task/app/modules/help/views/help_view.dart';
import 'package:moru_digital_task/app/modules/home/bindings/home_binding.dart';
import 'package:moru_digital_task/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HELP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => HelpView(),
      binding: HelpBinding(),
    ),
  ];
}
