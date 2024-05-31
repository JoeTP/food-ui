import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/presentation/home_layout/home_layout.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/text_style.dart';
import '../button.dart';
import 'order_failed.dart';
import 'order_success.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return _checkoutBottomSheet(context);
  }

  _listTiles({required String title, Widget? trailing}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          trailing!,
          SizedBox(width: 5.sp),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }

  Widget _checkoutBottomSheet(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Checkout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
              Padding(
                padding: EdgeInsets.only(right:4.sp),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.sp),
                  onTap: () {},
                  child: Icon(Icons.clear,size: 18.sp,),
                ),
              )
            ],
          ),
          Divider(),
          _listTiles(
            title: 'Payment Method',
            trailing: SvgPicture.asset('assets/images/visa.svg'),
          ),
          _listTiles(
            title: 'Promo Code',
            trailing: Text('Pick discount'),
          ),
          _listTiles(
            title: 'Total Cost',
            trailing: Text('\$13.23'),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text.rich(
              TextSpan(
                text: 'By placing an order you agree to our ',
                children: [
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' and ',
                        children: [
                          TextSpan(
                            text: 'Conditions.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.sp),
          DefaultButton(
            onTab: () {
              // showErrorOrderAlertDialog(context);
              showSuccessOrderBottomSheet(context);
            },
            text: 'Place Order',
          )
        ],
      ),
    );
  }

  showSuccessOrderBottomSheet(context) {
    Get.bottomSheet(
      isScrollControlled: true,
      enterBottomSheetDuration: Duration(milliseconds: 500),
      Stack(
        children: [
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/success-order-bg.png',
                fit: BoxFit.cover,
              )),
          Positioned(
            top: 100.sp,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/images/success-order.svg'),
          ),
          Positioned(
            top: 340.sp,
            left: 20.sp,
            right: 20.sp,
            child: Column(
              children: [
                Text(
                  'Your order has been accepted',style: bigTitlesTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.sp),
                Text(
                    'Your items has been placed and is on it\'s way to being processed',
                    style: smallTextStyle,
                    textAlign: TextAlign.center),
                SizedBox(height: 100.sp),
                DefaultButton(onTab: () {}, text: 'Track Order'),
                SizedBox(height: 10.sp),
                TextButton(onPressed: () {
                  //if the cart still has items, use Get.OffAll(HomeLayout())
                  Navigator.popUntil(context, (route) => route.isFirst);
                }, child: Text('Back to home'))
              ],
            ),
          )
        ],
      ),
    );
  }

  showErrorOrderAlertDialog(context) {
    Get.dialog(
      AlertDialog(

        surfaceTintColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15)
            .copyWith(top: 10),
        content: SizedBox(
          width: MediaQuery.of(context).size.width ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  InkWell(
                      borderRadius:  BorderRadius.circular(50.sp),
                      onTap: () {
                      Get.back();
                      },
                      child:  Icon(
                        Icons.clear,
                      ),
                    ),

                ],
              ),
              Image.asset(
                'assets/images/error-order.png',
              ),
              SizedBox(height: 20.sp),
              Text('Oops! Order Failed',style: bigTitlesTextStyle,),
              SizedBox(height: 10.sp),
              Text('Something went tembly wrong.',style: smallTextStyle),
              SizedBox(height: 25.sp),
              DefaultButton(onTab: () {}, text: 'Please Try Again'),
              SizedBox(height: 5.sp),
              TextButton(onPressed: () {

                Navigator.popUntil(context,(route) => route.isFirst);

              }, child: Text('Back to home'))
            ],
          ),
        ),
      ),
    );
  }
}
