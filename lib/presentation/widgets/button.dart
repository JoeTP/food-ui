import 'package:flutter/material.dart';
import 'package:food_ui/config/text_style.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({this.child,required this.onTab,
    this.bgColor = primaryGreenColor,
  this.text, super.key});

  final Widget? child;
  final String? text;
  final VoidCallback onTab;
  Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: 55.sp,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: (text == null)
            ? Center(child: child)
            : Center(
                child: Text(
                  text!,
                  style: buttonTextStyle,
                ),
              ),
      ),
    );
  }
}
