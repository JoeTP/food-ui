import 'package:flutter/material.dart';
import 'package:food_ui/core/app_router/app_router.dart';
import 'package:food_ui/main.dart';
import 'package:get/get.dart';

class SplashMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPref.getBool('isFirstTime') != null) {
      return RouteSettings(name: AppRouter.login_sc);
    }
  }
}
