import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:food_ui/controllers/app_controller.dart';
import 'package:food_ui/controllers/explore_controller.dart';
import 'package:food_ui/data/models/item_model.dart';
import 'package:food_ui/presentation/widgets/item_card.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/text_style.dart';
import '../../../config/theme/card_colors.dart';
import '../../widgets/search_bar.dart';

class ExploreSc extends StatelessWidget {
  ExploreSc({super.key});

  final TextEditingController searchController = TextEditingController();
  final AppController appController = Get.find();
  final ExploreController exploreController = Get.find();

 

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _body(context),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      pinned: false,
      floating: true,
      automaticallyImplyLeading: false,
      stretch: false,
      expandedHeight: 115.sp,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1,
        title: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Find Products',
                style: appBarTitleTextStyle,
              ),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: AppSearchBar(
                  controller: searchController,
                  onChanged: (v) {
                    appController.search(v);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey<String>('explore'),

      slivers: [
        _appBar(context),
        SliverToBoxAdapter(
          child: (appController.searchList.isEmpty &&
                  searchController.text.isNotEmpty)
              ? noDataFound()
              : GridView.builder(
                  itemCount: (appController.searchList.isEmpty ||
                          searchController.text.isEmpty)
                      ? exploreController.exploreList.length
                      : appController.searchList.length,
                  itemBuilder: (context, index) => searchController.text.isEmpty
                      ? _exploreCategories(index)
                      : _searchedItems(index),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.92105,
                    mainAxisExtent: 220.sp,
                    crossAxisSpacing: 15.sp,
                    mainAxisSpacing: 15.sp,
                  ),
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  padding: EdgeInsets.all(20.sp).copyWith(top: 10.sp),
                ),
        )
      ],
    );
  }

  Widget noDataFound() {
    return Center(
      child: Text(
        'No Data Found',
        style: itemCardDescriptionTextStyle,
      ),
    );
  }

  Widget _searchedItems(int index) {
    return ItemCard(
      image: appController.searchList[index].image,
      name: appController.searchList[index].name,
      description: appController.searchList[index].description,
      price: appController.searchList[index].price,
    );
  }

  Widget _exploreCategories(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorList[index]),
        borderRadius: BorderRadius.circular(18.sp),
        color: colorList[index].withOpacity(0.25),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.sp, horizontal: 10.sp)
              .copyWith(bottom: 10.sp),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child:
                      Image.asset(exploreController.exploreList[index].image),
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                exploreController.exploreList[index].name,
                style: itemCardNameTextStyle,
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
    );
  }
}
