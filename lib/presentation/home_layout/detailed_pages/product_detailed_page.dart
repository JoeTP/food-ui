import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/config/text_style.dart';
import 'package:food_ui/controllers/app_controller.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:food_ui/presentation/widgets/button.dart';
import 'package:food_ui/presentation/widgets/small_buttons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../config/theme/main_colors.dart';

const String description =
    'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.';

class ProductDetailedPage extends StatelessWidget {
  ProductDetailedPage({super.key});

  // final AppController appController = Get.find();

  final ExpandableController expandableController = ExpandableController();
  dynamic data = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.transparent,
            pinned: false,
            floating: true,
            automaticallyImplyLeading: false,
            stretch: false,
            // expandedHeight: 140.sp,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share_rounded))
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.transparent
                      ],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(25.sp),
                    ),
                  ),
                  width: double.infinity,
                  height: 240.sp,
                  child: Padding(
                    padding: EdgeInsets.all(18.sp),
                    child: Image.asset(
                      data.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Gap(30.sp),
                _productDetails(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _productDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.sp).copyWith(bottom: 30.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: itemCardNameTextStyle,
          ),
          SizedBox(height: 10.sp),
          Text(data.description, style: itemCardDescriptionTextStyle),
          SizedBox(height: 10.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: primaryGreyColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: SmallButtons(
                      child: Text(
                        '1',
                        style: itemCardPriceTextStyle,
                      ),
                      borderColor: primaryGreyColor,
                      bgColor: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: primaryGreenColor,
                  ),
                ],
              ),
              Text(
                '\$${data.price}',
                style: itemCardPriceTextStyle.copyWith(
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Gap(10.sp),
          _expandedSection('Product Details', description),
          _expandedSection('Nutrition', description),
          _expandedSection('Review', description, widget: _starsRate()),
          Gap(15.sp),
          DefaultButton(
            onTab: () {},
            text: 'Add to Cart',
          ),
        ],
      ),
    );
  }

  Widget _starsRate() {
    return Container(
      height: 20.sp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: starColor,
        ),
      ),
    );
  }

  Widget _expandedSection(String collapsed, String expanded, {Widget? widget}) {
    return Column(
      children: [
        Divider(
          height: 20.sp,
        ),
        ExpandablePanel(
            theme: ExpandableThemeData(
              useInkWell: false,
              iconColor: itemNameColor,
              iconSize: 28.sp,
              tapHeaderToExpand: true,
              tapBodyToExpand: true,
              tapBodyToCollapse: true,
              hasIcon: true,
              expandIcon: Icons.keyboard_arrow_right_rounded,
              collapseIcon: Icons.keyboard_arrow_down_rounded,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              iconRotationAngle: 2,
              // useInkWell: true,
            ),
            collapsed: SizedBox(),
            header: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    collapsed,
                    style: itemCardPriceTextStyle,
                  ),
                ),
                widget ?? const SizedBox(),
              ],
            ),
            expanded: Text(
              expanded,
              style: itemCardDescriptionTextStyle,
            )),
      ],
    );
  }
}
