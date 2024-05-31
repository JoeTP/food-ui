import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui/controllers/app_controller.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:food_ui/presentation/widgets/button.dart';
import 'package:food_ui/presentation/widgets/item_banner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/text_style.dart';
import '../../widgets/popups/checkout_bottom_sheet.dart';

class CartSc extends StatelessWidget {
  CartSc({super.key});

  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      autoRemove: false,
      init: CartController(),
      builder: (controller) => Scaffold(
        // appBar: _appBar(context),
        body: _body(context, appController, controller),
        floatingActionButton: _floatingActionButton(context, controller),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        'My Cart',
        style: appBarTitleTextStyle,
      ),
      centerTitle: true,
      elevation: 2,
      shadowColor: Colors.black,
    );
  }

  Widget _body(
    BuildContext context,
    AppController appController,
    CartController cartController,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.sp),
          Text(
            'My Cart',
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
            itemBuilder: (context, index) => SizedBox(
              height: 100.sp,
              child: ItemBanner(
                item: appController.shopItemsList[index],
                increaseAmount: () => cartController.increaseAmount(index),
                decreaseAmount: () => cartController.decreaseAmount(index),
                itemQuantity: cartController.cartItems[index].quantity,
                deleteItem: () => cartController.removeItem(index),
              ),
            ),
            itemCount: cartController.cartItems.length,
            padding: EdgeInsets.symmetric(
              vertical: 20.sp,
              horizontal: 20.sp,
            ).copyWith(bottom: 85.sp),
          ),
        ],
      ),
    );
  }

  Widget _floatingActionButton(
      BuildContext context, CartController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: controller.cartItems.isNotEmpty
          ? DefaultButton(
              onTab: () {
                //DO REQUEST HERE
                showPlaceOrderBottomSheet(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: Row(
                  children: [
                    SizedBox(),
                    Text(
                      'Go to Checkout',
                      style: buttonTextStyle,
                    ),
                    Spacer(),
                    Container(
                        decoration: BoxDecoration(
                          color: Color(0xff489E67),
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        padding: EdgeInsets.all(4.sp),
                        //TODO: dont forget the style
                        child: Text(
                          '\$${controller.getCartTotalPrice().toString()}',
                          style: itemCardPriceTextStyle.copyWith(
                              fontSize: 9.sp, color: Colors.white),
                        )),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }

  String getItemTotalPrice(ItemModel item, int quantity) {
    double itemTotal = 0.0;
    itemTotal += double.parse(item.price) * quantity;
    return itemTotal.toStringAsFixed(2);
  }

  showPlaceOrderBottomSheet(context) {
    Get.bottomSheet(
      enterBottomSheetDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.white,
      CheckoutBottomSheet(),
    );
  }
}
