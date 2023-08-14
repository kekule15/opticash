import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/appColors.dart';
import 'image_widgets.dart';

Widget welcomeTab({
  required BuildContext context,
  required String icon,
  required String title,
  required String description,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
        ),
        icon.toString().contains("svg")
            ? SvgImage(
                asset: icon,
                width: 90.w,
                height: 90.w,
              )
            : ImageWidget(
                asset: icon,
                width: 90.w,
                height: 90.w,
              ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .primaryTextTheme
              .headlineMedium
              ?.copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
