import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HighLightedText extends StatelessWidget {
  const HighLightedText(
      {required this.text, this.bgColor = Colors.grey, super.key});

  final String text;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        color: bgColor,
      ),
      child: Center(child: Text(text)),
    );
  }
}
