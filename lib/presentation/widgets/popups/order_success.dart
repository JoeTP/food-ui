import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../button.dart';

class OrderSuccessPop extends StatelessWidget {
  const OrderSuccessPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                'Your order has been accepted',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.sp),
              Text(
                  'Your items has been placcd and is on it\'s way to being processed',
                  textAlign: TextAlign.center),
              SizedBox(height: 100.sp),
              DefaultButton(onTab: () {}, text: 'Track Order'),
              SizedBox(height: 10.sp),
              TextButton(onPressed: () {}, child: Text('Back to home'))
            ],
          ),
        )
      ],
    );
  }
}
