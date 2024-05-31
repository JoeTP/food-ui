import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:food_ui/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:food_ui/presentation/home_layout/nav_bar_pages/cart_sc.dart';
import 'package:food_ui/presentation/home_layout/nav_bar_pages/explore_sc.dart';
import 'package:food_ui/presentation/home_layout/nav_bar_pages/favorite_sc.dart';
import 'package:food_ui/presentation/home_layout/nav_bar_pages/profile_sc.dart';
import 'package:food_ui/presentation/home_layout/nav_bar_pages/shop_sc.dart';

import '../widgets/my_bnb_item.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  // final AppController appController = Get.find();

 final  List<Widget> screens = [
    ShopSc(),
    ExploreSc(),
    CartSc(),
    FavoriteSc(),
    ProfileSc()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
        init: AppController(),
        builder: (controller) =>  Scaffold(
          body: screens[controller.currentIndex.value],
          bottomNavigationBar: _bottomNavBar(context, controller),
        ),
      ),
    );
  }

  Widget _bottomNavBar(BuildContext context, controller) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset:  Offset(0, -5),
            color: primaryGreyColor.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 15),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp)),
        child: SizedBox(
          height: 55.sp,
          child: BottomNavigationBar(
            selectedItemColor: primaryGreenColor,
            unselectedItemColor: itemNameColor,
            onTap: (i) {
              controller.changeIndex(i);
            },

            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: controller.bottomNavBarItems(),
            useLegacyColorScheme: true,
            // fixedColor: primaryGreyColor,
          ),
        ),
      ),
    );
  }
}
