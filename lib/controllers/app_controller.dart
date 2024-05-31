import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ui/config/shop_item_names.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:food_ui/main.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_router/app_router.dart';
import '../presentation/widgets/popups/checkout_bottom_sheet.dart';
import 'dart:io';

class AppController extends GetxController {
  getStartButton() {
    sharedPref.setBool('isFirstTime', false);
    Get.offAndToNamed(AppRouter.login_sc);
  }

  RxList<ItemModel> searchList = <ItemModel>[].obs;
  RxBool notFound = false.obs;

  search(String v) {
    searchList.value = shopItemsList
        .where(
            (element) => element.name.toLowerCase().contains(v.toLowerCase()))
        .toList();
    if (searchList.isEmpty) {
      notFound.value = true;
    } else {
      notFound.value = false;
    }
  }

  RxInt currentIndex = 0.obs;

  changeIndex(int index) {
    currentIndex.value = index;
  }

  static double bnbIconSize = 20;

  List<BottomNavigationBarItem> bottomNavBarItems() =>
      <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/shop.svg',
            width: bnbIconSize,
            height: bnbIconSize,
            colorFilter: currentIndex.value == 0
                ? ColorFilter.mode(
                    primaryGreenColor,
                    BlendMode.srcIn,
                  )
                : ColorFilter.mode(itemNameColor, BlendMode.srcIn),
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/explore.svg',
            width: bnbIconSize,
            height: bnbIconSize,
            colorFilter: currentIndex.value == 1
                ? ColorFilter.mode(
                    primaryGreenColor,
                    BlendMode.srcIn,
                  )
                : ColorFilter.mode(itemNameColor, BlendMode.srcIn),
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            width: bnbIconSize,
            height: bnbIconSize,
            colorFilter: currentIndex.value == 2
                ? ColorFilter.mode(
                    primaryGreenColor,
                    BlendMode.srcIn,
                  )
                : ColorFilter.mode(itemNameColor, BlendMode.srcIn),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/favorite.svg',
            width: bnbIconSize,
            height: bnbIconSize,
            colorFilter: currentIndex.value == 3
                ? ColorFilter.mode(
                    primaryGreenColor,
                    BlendMode.srcIn,
                  )
                : ColorFilter.mode(itemNameColor, BlendMode.srcIn),
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profile.svg',
            width: bnbIconSize,
            height: bnbIconSize,
            colorFilter: currentIndex.value == 4
                ? ColorFilter.mode(
                    primaryGreenColor,
                    BlendMode.srcIn,
                  )
                : ColorFilter.mode(itemNameColor, BlendMode.srcIn),
          ),
          label: 'Profile',
        ),
      ];

  static String imageAddress(String item) {
    return 'assets/shop_items/$item.png';
  }

  final List<ItemModel> groceryItemsList = [
    ItemModel(
        name: 'beans',
        description: 'Any Description',
        price: '2',
        image: imageAddress(beans)),
    ItemModel(
        name: 'rice',
        description: 'Any Description',
        price: '3',
        image: imageAddress(rice)),
    ItemModel(
        name: 'beans',
        description: 'Any Description',
        price: '1',
        image: imageAddress(beans)),
    ItemModel(
        name: 'rice',
        description: 'Any Description',
        price: '16',
        image: imageAddress(rice)),
  ];
  final List<ItemModel> shopItemsList = [
    ItemModel(
      name: 'apple',
      description: 'Any Description',
      price: '103',
      image: imageAddress(apple),
    ),
    ItemModel(
        name: 'banana',
        description: 'Any Description',
        price: '110',
        image: imageAddress(banana)),
    ItemModel(
        name: 'orange',
        description: 'Any Description',
        price: '18',
        image: imageAddress(orangeJuice)),
    ItemModel(
        name: 'apple juice',
        description: 'Any Description',
        price: '20',
        image: imageAddress(appleJuice)),
    ItemModel(
        name: 'pepsi',
        description: 'Any Description',
        price: '30',
        image: imageAddress(pepsi)),
    ItemModel(
        name: 'coke',
        description: 'Any Description',
        price: '50',
        image: imageAddress(coke)),
    ItemModel(
        name: 'coke2',
        description: 'Any Description',
        price: '20',
        image: imageAddress(coke2)),
    ItemModel(
        name: 'noodles',
        description: 'Any Description',
        price: '10',
        image: imageAddress(noodles)),
    ItemModel(
        name: 'chicken',
        description: 'Any Description',
        price: '10',
        image: imageAddress(chicken)),
    ItemModel(
        name: 'eggs',
        description: 'Any Description',
        price: '60',
        image: imageAddress(eggs)),
    ItemModel(
        name: 'oils',
        description: 'Any Description',
        price: '120',
        image: imageAddress(oils)),
    ItemModel(
        name: 'felfel',
        description: 'Any Description',
        price: '70',
        image: imageAddress(felfel)),
    ItemModel(
        name: 'mayo',
        description: 'Any Description',
        price: '10',
        image: imageAddress(mayo)),
    ItemModel(
        name: 'ginger',
        description: 'Any Description',
        price: '10',
        image: imageAddress(ginger)),
    ItemModel(
        name: 'macrony',
        description: 'Any Description',
        price: '10',
        image: imageAddress(macrony)),
    ItemModel(
        name: 'macrony2',
        description: 'Any Description',
        price: '10',
        image: imageAddress(macrony2)),
    ItemModel(
        name: 'basket eggs',
        description: 'Any Description',
        price: '10',
        image: imageAddress(basketEggs)),
    ItemModel(
        name: 'sprite',
        description: 'Any Description',
        price: '10',
        image: imageAddress(sprite)),
  ];

  List<Color> colorList = [
    Color(0xFFeef7f1),
    Color(0xFFfef6ed),
    Color(0xFFfde9e4),
    Color(0xFFf4ebf7),
    Color(0xFFfef9e5),
    Color(0xFFedf7fd),
  ];

  //GO HOME BUTTON
  static void goHome() {
    Get.offAllNamed('/home');
  }
}
