import 'package:flutter/cupertino.dart';
import 'package:food_ui/controllers/app_controller.dart';
import 'package:get/get.dart';

import '../core/app_router/app_router.dart';
import '../main.dart';

class AuthController extends GetxController {

  AppController appController = Get.find();
  validateLogin(GlobalKey<FormState> key, VoidCallback fn) {
    if (key.currentState!.validate()) {
      //TODO: HTTP request is here
      sharedPref.setBool('isLoggedIn', true);
      fn();
    }
  }

  Future<void> logout()async{
    sharedPref.setBool('isLoggedIn', false);
    Get.offAndToNamed(AppRouter.login_sc);
  await  Future.delayed(Duration(seconds: 1));
    appController.currentIndex.value = 0;
  }
}
