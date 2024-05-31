import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/config/theme/main_colors.dart';

class SmallButtons extends StatelessWidget {
  SmallButtons({
    this.onTap,
    required this.child,
    this.bgColor = primaryGreenColor,
    this.borderColor = primaryGreyColor,
    super.key,
  });

  final VoidCallback? onTap;
  final Widget child;
  final Color? bgColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45.sp,
        height: 45.sp,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(17.sp),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
