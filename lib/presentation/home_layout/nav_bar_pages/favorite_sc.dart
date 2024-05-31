import 'package:flutter/material.dart';
import 'package:food_ui/controllers/app_controller.dart';
import 'package:food_ui/presentation/widgets/favorit_item_banner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/text_style.dart';
import '../../widgets/button.dart';

class FavoriteSc extends StatelessWidget {
  FavoriteSc({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();

    return Scaffold(
      // appBar: _appBar(context),
      body: _body(context, appController),
      floatingActionButton: appController.shopItemsList.isNotEmpty
          ? _floatingActionButton(context)
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Favorite',
        style: appBarTitleTextStyle,
      ),
      centerTitle: true,
      elevation: 2,
      shadowColor: Colors.black,
    );
  }

  Widget _body(BuildContext context, AppController appController) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.sp),
          Text(
            'Favorites',
            style: appBarTitleTextStyle,
          ),
          SizedBox(height: 15.sp),
          Divider(),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              height: 25.sp,
            ),
            itemBuilder: (context, index) => FavoriteItemBanner(
              item: appController.shopItemsList[index],
            ),
            itemCount: appController.shopItemsList.length,
            padding: EdgeInsets.symmetric(
              vertical: 20.sp,
              horizontal: 20.sp,
            ).copyWith(bottom: 80.sp),
          ),
        ],
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: DefaultButton(
        onTab: () {},
        text: 'Add all to Cart',
      ),
    );
  }
}
