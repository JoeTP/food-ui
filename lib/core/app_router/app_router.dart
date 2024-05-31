import 'package:food_ui/utils/bindings/global_bindings.dart';
import 'package:food_ui/utils/middleware/auth_middleware.dart';
import 'package:food_ui/utils/middleware/splash_middleware.dart';
import 'package:get/get.dart';

import '../../presentation/auth_pages/code_page/code_screen.dart';
import '../../presentation/auth_pages/login_page/login_screen.dart';
import '../../presentation/auth_pages/register_page/register_screen.dart';
import '../../presentation/home_layout/detailed_pages/product_detailed_page.dart';
import '../../presentation/home_layout/home_layout.dart';
import '../../presentation/splash_page/splash_sc.dart';

class AppRouter {
  static const String splash_sc = '/splash_sc';
  static const String login_sc = '/login_sc';
  static const String register_sc = '/register_sc';
  static const String code_sc = '/code_sc';
  static const String homeLayout_sc = '/home_sc';
  static const String productDetailed_sc = '/productDetailed_sc';

  // static const String shop_sc = '/shop_sc';
  // static const String explore_sc = '/explore_sc';
  // static const String cart_sc = '/cart_sc';
  // static const String favorite_sc = '/favorite_sc';
  // static const String profile_sc = '/profile_sc';

  static List<GetPage> getPages = [
    GetPage(
      name: splash_sc,
      page: () => SplashSc(),
      middlewares: [
        SplashMiddleWare(),
      ],
    ),
    GetPage(
      name: login_sc,
      page: () => LoginSc(),
      middlewares: [AuthMiddleWare()],
    ),
    GetPage(name: register_sc, page: () =>  RegisterSc()),
    GetPage(name: code_sc, page: () => const CodeSc()),
    GetPage(name: homeLayout_sc, page: () => HomeLayout()),
    GetPage(name: productDetailed_sc, page: () => ProductDetailedPage()),
  ];
}
