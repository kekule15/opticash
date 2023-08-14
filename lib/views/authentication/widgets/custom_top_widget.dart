import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class CustomTopWidget extends ConsumerWidget {
  final String title;
  final String subtitle;
  final bool isBack;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final double? height;
  const CustomTopWidget(
      {required this.title,
      required this.subtitle,
      required this.isBack,
      this.bgColor,
      this.textColor,
      this.iconColor,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height ?? 130.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: bgColor ?? Theme.of(context).scaffoldBackgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
              child: Visibility(
                  visible: isBack == false ? false : true,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Card(
                       // color: Theme.of(context).canvasColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.5.w),
                          borderRadius: BorderRadius.circular(7.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child:  Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).iconTheme.color!.withOpacity(0.7),
                            size: 17.sp,
                           // color: iconColor ?? AppColors.white,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(
                     // color: textColor ?? AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              subtitle,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(
                     // color: textColor ?? AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}

class SecondCustomTopWidget extends ConsumerWidget {
  final String title;
  final bool isBack;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final double? height;
  const SecondCustomTopWidget(
      {required this.title,
      required this.isBack,
      this.bgColor,
      this.textColor,
      this.iconColor,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height ?? 100.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: bgColor ?? AppColors.black),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 30.h,
              child: Visibility(
                  visible: isBack == false ? false : true,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: iconColor ?? AppColors.white,
                      ))),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(
                      color: textColor ?? AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp),
            ),
          ],
        ),
      ),
    );
  }
}
