

import 'package:food_ui/controllers/auth_controller.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/controllers/explore_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/app_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController(),permanent: true);
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ExploreController());
    Get.lazyPut(() => CartController());
  }
}