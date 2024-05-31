import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/core/app_router/app_router.dart';
import 'package:food_ui/utils/bindings/global_bindings.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/app_controller.dart';


late final sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 736),
      builder: (context, child) {
        ScreenUtil.init(context);

        return GetMaterialApp(
          initialBinding: GlobalBindings(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          ),
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.getPages,
          initialRoute: AppRouter.splash_sc,
          // home: Tester(),
        );
      },
    );
  }
}
