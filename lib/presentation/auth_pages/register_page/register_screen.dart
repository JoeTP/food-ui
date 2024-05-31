import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:food_ui/presentation/home_layout/nav_bar_pages/profile_sc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/text_style.dart';
import '../../../core/app_router/app_router.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';

class RegisterSc extends StatelessWidget {
   RegisterSc({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Image.asset('assets/images/bg-blur-top.png'),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset('assets/images/bg-blur-bot.png'),
            ),
            Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.sp, vertical: 30.sp),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  'assets/images/carrotLogo.svg')),
                          SizedBox(height: 100.sp),

                          Text('Sign Up',style: bigTitlesTextStyle,),
                          SizedBox(height: 15.sp),

                          Text('Enter your credentials to continue',style: smallTextStyle,),
                          SizedBox(height: 40.sp),
                          DefaultTextField(
                            showSuffix: false,

                            hintText: 'Username',
                            keyboardType: TextInputType.text,
                            controller: usernameController,
                          ),
                          SizedBox(height: 30.sp),
                          DefaultTextField(
                            showSuffix: false,

                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                          SizedBox(height: 30.sp),
                          DefaultTextField(
                            hintText: 'Password',
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                          ),
                          SizedBox(height: 20.sp),
                          Text.rich(
                            TextSpan(
                              text: "By continuing you agree to our ",
                              children: [
                                TextSpan(
                                    text: 'Terms of Service',style: TextStyle(color: primaryGreenColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          Get.defaultDialog()
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                    text: 'Privacy Policy.', style: TextStyle(color: primaryGreenColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          Get.defaultDialog()
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30.sp),
                          DefaultButton(text: 'Sign Up', onTab: () {
                            authController.validateLogin(
                                _formKey,
                                    ()=> Get.toNamed(AppRouter.homeLayout_sc)
                            );
                          }),
                          SizedBox(height: 25.sp),
                          Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                text: "Already have an account?", style: TextStyle(fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: ' Sign In',style: seeAllTextStyle.copyWith(fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            Get.toNamed(AppRouter.register_sc)
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
