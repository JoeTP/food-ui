import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/text_style.dart';

class FavoriteItemBanner extends StatelessWidget {
   FavoriteItemBanner({required this.item, super.key});

   final ItemModel item;
  final double bannerHeight = 60.sp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bannerHeight,
      child: Row(
        children: [
          Container(
            width: bannerHeight * 0.9,
            height: bannerHeight,
            child: Image.asset(item.image),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:  10.0.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name,style:  itemCardNameTextStyle,),
                    Text(item.description,style: itemCardDescriptionTextStyle,),

                  ],
                ),
              )),
          Row(
            children: [
              Text('\$${item.price}',style: itemCardPriceTextStyle,),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/favorite.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
