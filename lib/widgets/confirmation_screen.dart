import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages

class ConfirmationPage extends ConsumerWidget {
  final String? title;
  final String? description;
  final VoidCallback onTap;
  final String? btnTitle;
  const ConfirmationPage(
      {required this.title,
      required this.description,
      required this.onTap,
      this.btnTitle,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                welcomeTab(context: context),
                footerWidget(context: context, ref: ref),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget welcomeTab({required BuildContext context}) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Icon(
              (Icons.task_alt),
              size: 90.w,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              title ?? "",
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                      //color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              description ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium
                  ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget footerWidget({required BuildContext context, required WidgetRef ref}) {
    // var authViewModel = ref.watch(userAuthViewModelProvider);
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: buttonPadding.w),
        child: Column(
          children: [
            ActionCustomButton(
                title: btnTitle ?? "CONTINUE", onclick: () => onTap()),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
