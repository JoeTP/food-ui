import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/main_colors.dart';

class AppSearchBar extends StatelessWidget {
 const AppSearchBar({required this.controller,required this.onChanged, super.key});

 final TextEditingController controller;
 final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      // trailing: ,
      onChanged: (v){
        onChanged(v);

      },
      keyboardType: TextInputType.text,
      backgroundColor:  MaterialStateProperty.all(searchBarColor),
      shape:  MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
      elevation: MaterialStateProperty.all(0),
      hintText: 'Search Store',
      leading: SvgPicture.asset('assets/icons/search.svg'),
      padding:   MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10.sp)),
    );
    // return TextField(
    //   controller: controller,
    //   keyboardType: TextInputType.text,
    //   decoration: InputDecoration(
    //     fillColor: Colors.red,
    //     border: UnderlineInputBorder(),
    //     prefixIcon: Icon(Icons.search),
    //     hintText: 'Search',
    //   ),
    // );
  }


}
