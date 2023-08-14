import 'package:opticash/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

customAppBar() {
  return const PreferredSize(
      preferredSize: Size.fromHeight(20),
      child: Column(
        children: [],
      ));
}

customAppBarWithOnTap(
    {required String title,
    Color? bgcolor,
    Color? itemColor,
    VoidCallback? onTap}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: InkWell(
      onTap: () => onTap!(),
      child: Icon(
        Icons.west,
        color: itemColor ?? AppColors.black,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
          color: itemColor ?? AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp),
    ),
  );
}
