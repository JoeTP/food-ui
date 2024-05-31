import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui/config/theme/main_colors.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/text_style.dart';
import '../../../controllers/app_controller.dart';
import '../../widgets/food_sections.dart';
import '../../widgets/item_card.dart';
import '../../widgets/search_bar.dart';

class ShopSc extends StatelessWidget {
  ShopSc({super.key});

  final TextEditingController searchController = TextEditingController();
  final AppController appController = Get.find();

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
      expandedHeight: 140.sp,
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
              SvgPicture.asset('assets/images/carrotLogo.svg', height: 30.sp),
              SizedBox(height: 5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/location.svg'),
                  SizedBox(width: 5.sp),
                  Text(
                    'Alexandria',
                    style: itemCardPriceTextStyle,
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: AppSearchBar(
                  onChanged: (v) {
                    appController.search(v);
                  },
                  controller: searchController,
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
      // key: const PageStorageKey<String>('shop'),
      slivers: [
        _appBar(context),
        SliverToBoxAdapter(
          child: (appController.searchList.isEmpty &&
                  searchController.text.isNotEmpty)
              ? noDataFound()
              : searchController.text.isEmpty
                  ? _shopScreenBody(context)
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: PageScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.92105,
                        mainAxisExtent: 220.sp,
                        crossAxisSpacing: 15.sp,
                        mainAxisSpacing: 15.sp,
                      ),
                      itemBuilder: (context, index) => _searchedItems(index),
                      itemCount: appController.searchList.length,
                    ),
        )
      ],
    );
  }

  Widget _grocerySection(BuildContext context, AppController appController) {
    return SizedBox(
      height: 90.sp,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: appController.groceryItemsList.length,
        padding:
            EdgeInsets.symmetric(horizontal: 10.sp).copyWith(bottom: 20.sp),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _groceryCards(context, index, appController),
      ),
    );
  }

  Widget _groceryCards(
      BuildContext context, int index, AppController appController) {
    final beansColor = Color(0xffF8A44C);
    final riceColor = Color(0xff53B175);
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      width: 150.sp,
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? beansColor.withOpacity(0.3)
              : riceColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(18.sp)),
      child: Row(
        children: [
          Image.asset(appController.groceryItemsList[index].image),
          SizedBox(width: 15.sp),
          Text(
            appController.groceryItemsList[index].name,
            style: itemCardNameTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _offerBanner(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: primaryGreyColor),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        width: double.infinity,
        height: 100.sp,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.sp),
          child: Image.asset(
            'assets/images/offer-banner.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
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

  Widget _shopScreenBody(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _offerBanner(context),
          SizedBox(height: 30.sp),
          FoodSections(
            title: 'Exclusive Offers',
            list: appController.shopItemsList,
          ),
          SizedBox(height: 30.sp),
          FoodSections(
            title: 'Best Selling',
            list: appController.shopItemsList,
          ),
          SizedBox(height: 30.sp),
          FoodSections(
            title: 'Groceries',
            list: appController.shopItemsList,
            spaceInBetween: _grocerySection(context, appController),
          ),
        ],
      ),
    );
  }
}
