import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/text_style.dart';
import '../button.dart';

class OrderFailed extends StatelessWidget {
  const OrderFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 0)
          .copyWith(top: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.clear,
                ),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              )
            ],
          ),
          Image.asset(
            'assets/images/error-order.png',
          ),
          SizedBox(height: 20.sp),
          Text(
            'Oops! Order Failed',
            style: bigTitlesTextStyle,
          ),
          SizedBox(height: 10.sp),
          Text(
            'Something went tembly wrong.',
            style: smallTextStyle,
          ),
          SizedBox(height: 25.sp),
          DefaultButton(onTab: () {}, text: 'Please Try Again'),
          SizedBox(height: 5.sp),
          TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => false);
              },
              child: Text('Back to home'))
        ],
      ),
    );
  }
}
