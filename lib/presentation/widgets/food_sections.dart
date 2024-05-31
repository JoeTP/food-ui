import 'package:flutter/material.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/text_style.dart';
import 'item_card.dart';

class FoodSections extends StatelessWidget {
  FoodSections(
      {required this.title,
      required this.list,
      this.spaceInBetween,
      super.key});

  final String title;
  final List<ItemModel> list;
 final Widget? spaceInBetween;

  EdgeInsetsGeometry pagePadding = EdgeInsets.symmetric(horizontal: 20.sp);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: pagePadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: headlineTextStyle,),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                    onTap: (){},
                    child: Text('See all',style: seeAllTextStyle,)),
              )
            ],
          ),
        ),
        SizedBox(height: 20.sp),
        spaceInBetween == null ? SizedBox() : spaceInBetween!,
        SizedBox(
          height: 240.sp,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: ItemCard(
                image: list[index].image,
                name: list[index].name,
                description: list[index].description,
                price: list[index].price,
              ),
            ),
            itemCount: list.length,
          ),
        )
      ],
    );
  }
}
