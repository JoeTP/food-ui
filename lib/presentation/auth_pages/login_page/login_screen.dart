import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ui/controllers/auth_controller.dart';
import 'package:food_ui/core/app_router/app_router.dart';
import 'package:food_ui/presentation/home_layout/home_layout.dart';
import 'package:food_ui/presentation/widgets/button.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/text_style.dart';
import '../../widgets/text_field.dart';

class LoginSc extends StatelessWidget {
  LoginSc({super.key});

  //TODO: fix the bottom part is levitating when keyboard is open

  final AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                          Text(
                            'Loging',
                            style: bigTitlesTextStyle,
                          ),
                          SizedBox(height: 15.sp),
                          Text(
                            'Enter your email and password',
                            style: smallTextStyle,
                          ),
                          SizedBox(height: 40.sp),
                          DefaultTextField(
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            obscureText: false,
                          ),
                          SizedBox(height: 30.sp),
                          DefaultTextField(
                            showSuffix: true,
                            hintText: 'Password',
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                          ),
                          SizedBox(height: 20.sp),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Forgot Password?',
                            ),
                          ),
                          SizedBox(height: 30.sp),
                          DefaultButton(
                            text: 'Log In',
                            onTab: () {
                              authController.validateLogin(_formKey, () {
                                Get.toNamed(AppRouter.homeLayout_sc);
                              });
                            },
                          ),
                          SizedBox(height: 25.sp),
                          Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: ' Signup',
                                      style: seeAllTextStyle.copyWith(
                                          fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            Get.offAndToNamed(AppRouter.register_sc))
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
