import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_svg/svg.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:food_ui/core/app_router/app_router.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:food_ui/presentation/widgets/small_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/text_style.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {required this.image,
      required this.name,
      required this.description,
      required this.price,
      super.key});

  final String image;
  final String name;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRouter.productDetailed_sc, arguments: [
          ItemModel(name: name, description: description, image: image, price: price)
        ]);
      },
      child: Container(
        padding: EdgeInsets.all(15.sp),
        // margin: EdgeInsets.symmetric(horizontal: 10.sp),
        width: 170.sp,
        height: 250.sp,
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryGreyColor,
          ),
          borderRadius: BorderRadius.circular(18.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  image,
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Text(name,style: itemCardNameTextStyle,),
            SizedBox(height: 5.sp),
            Text('7pcs, Priceg',style: itemCardDescriptionTextStyle,),
            SizedBox(height: 15.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('\$$price',style: itemCardPriceTextStyle,), SmallButtons(
                child: Icon(Icons.add,color: Colors.white,),
              )],
            )
          ],
        ),
      ),
    );
  }
}
