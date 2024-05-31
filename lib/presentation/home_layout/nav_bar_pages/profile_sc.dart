import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:food_ui/presentation/widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

import '../../../config/text_style.dart';
import '../../../controllers/auth_controller.dart';

final AuthController authController = Get.find();
class ProfileSc extends StatelessWidget {
  ProfileSc({super.key});

  _listTiles({
    required Widget leading,
    required String title,
  }) {
    return ListTile(
      minLeadingWidth: 22.sp,
      leading: leading,
      title: Text(
        title,
        style: profileTileTextStyle,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
      ),
      onTap: () {},
    );
  }

  static SvgPicture returnSvg(String image) {
    return SvgPicture.asset(
      'assets/icons/$image.svg',
      fit: BoxFit.cover,
      alignment: Alignment.centerLeft,
      width: 20.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List listTileItems = [
      _listTiles(leading: returnSvg('orders'), title: 'Orders'),
      _listTiles(
        leading: returnSvg('details'),
        title: 'My Details',
      ),
      _listTiles(
        leading: returnSvg('location2'),
        title: 'Delivery Address',
      ),
      _listTiles(
        leading: returnSvg('visa'),
        title: 'Payment Methods',
      ),
      _listTiles(
        leading: returnSvg('promo'),
        title: 'Promo Card',
      ),
      _listTiles(
        leading: returnSvg('notification'),
        title: 'Notifications',
      ),
      _listTiles(
        leading: returnSvg('help'),
        title: 'Help',
      ),
      _listTiles(
        leading: returnSvg('about'),
        title: 'About',
      ),
    ];

    return Scaffold(
      body: _body(context, listTileItems),
    );
  }

  Widget _body(context, List listTileItems) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  index == 0 ? _profileSection() : listTileItems[index - 1],
              separatorBuilder: (context, index) =>
                  index == 0 ? SizedBox() : Divider(),
              itemCount: listTileItems.length + 1),
          Divider(),
          SizedBox(
            height: 20.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: DefaultButton(
              bgColor: searchBarColor,
              onTab: ()async {
              await  authController.logout();
              },
              child: _buttonContainment(),
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
        ],
      ),
    );
  }

  Widget _profileSection() {
    return SizedBox(
      height: 120.sp,
      child: DrawerHeader(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.sp,
              width: 50.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                image: DecorationImage(
                  image: AssetImage('assets/images/pp.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Youssif Nasser',
                    overflow: TextOverflow.ellipsis,
                    style: profileTileTextStyle,
                  ),
                  Text(
                    'youssif.nasser.m@gmail.com',
                    overflow: TextOverflow.ellipsis,
                    style: itemCardDescriptionTextStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonContainment() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.logout,
            color: primaryGreenColor,
            size: 18.sp,
          ),
          Text(
            'Log Out',
            style: buttonTextStyle.copyWith(
                color: primaryGreenColor, fontSize: 14.sp),
          ),
          SizedBox(
            width: 16.sp,
          )
        ],
      ),
    );
  }
}
