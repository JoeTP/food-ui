import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:food_ui/presentation/widgets/small_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/text_style.dart';
import '../../config/theme/main_colors.dart';

class ItemBanner extends StatelessWidget {
  ItemBanner({
    required this.item,
    required this.itemQuantity,
    required this.increaseAmount,
    required this.decreaseAmount,
    required this.deleteItem,
    super.key,
  });

  final double bannerHeight = 75.sp;

  final ItemModel item;
  int itemQuantity;
  final VoidCallback increaseAmount;
  final VoidCallback decreaseAmount;
  final VoidCallback deleteItem;

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
              padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: itemCardNameTextStyle,
                      ),
                      Text(
                        item.description,
                        style: itemCardDescriptionTextStyle,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SmallButtons(
                            onTap: decreaseAmount,
                            child: Icon(
                              Icons.remove,
                              color: primaryGreyColor,
                            ),
                            bgColor: Colors.transparent),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: Text(
                            itemQuantity.toString(),
                            style: itemCardNameTextStyle,
                          ),
                        ),
                        SmallButtons(
                          onTap: increaseAmount,
                          child: Icon(
                            Icons.add,
                            color: primaryGreenColor,
                          ),
                          bgColor: Colors.transparent,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50.sp),
                onTap: deleteItem,
                child: Icon(
                  Icons.clear,
                  color: primaryGreyColor,
                ),
              ),
              Text(
                '\$${getItemTotalPrice(itemQuantity)}',
                style: itemCardPriceTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }

 String getItemTotalPrice(int quantity) {
    double itemTotal = 0.0;
    itemTotal += double.parse(item.price) * quantity;
    return itemTotal.toStringAsFixed(2);
  }

}
