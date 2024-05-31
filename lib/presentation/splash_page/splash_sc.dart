import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui/config/text_style.dart';
import 'package:food_ui/controllers/app_controller.dart';
import 'package:food_ui/presentation/widgets/button.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashSc extends StatelessWidget {
  SplashSc({super.key});

 final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(30.sp).copyWith(bottom: 0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              SvgPicture.asset(
                'assets/images/carrotLogo2.svg',
                height: 30.sp,
                width: 30.sp,
              ),
              SizedBox(height: 20.sp),
              Text(
                'Welcome to our store',
                textAlign: TextAlign.center,
                style: splashTitleTextStyle,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'Ger your groceries in as fast as one hour',
                textAlign: TextAlign.center,
                style: splashSubtitleTextStyle,
              ),
              SizedBox(
                height: 30.sp,
              ),
              DefaultButton(
                child: Text(
                  'Get Started',
                  style: buttonTextStyle,
                ),
                onTab: () {
                  appController.getStartButton();
                },
              ),
              SizedBox(
                height: 90.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
