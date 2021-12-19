import 'package:get/get.dart';

import 'package:bike_app/app/modules/accueil/bindings/accueil_binding.dart';
import 'package:bike_app/app/modules/accueil/views/accueil_view.dart';
import 'package:bike_app/app/modules/boarding_screen/bindings/boarding_screen_binding.dart';
import 'package:bike_app/app/modules/boarding_screen/views/boarding_screen_view.dart';
import 'package:bike_app/app/modules/home/bindings/home_binding.dart';
import 'package:bike_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOARDING_SCREEN,
      page: () => BoardingScreenView(),
      binding: BoardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.ACCUEIL,
      page: () => AccueilView(),
      binding: AccueilBinding(),
    ),
  ];
}
