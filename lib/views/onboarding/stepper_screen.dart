import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/utils/svgs.dart';
import 'package:opticash/views/authentication/login.dart';
import 'package:opticash/widgets/app_logo_widget.dart';
import 'package:opticash/widgets/custom_appbar.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:opticash/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class StepperScreen extends ConsumerWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding:
            const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20.h),
          const AppLogoWidget(),
          SizedBox(height: 20.h),
          Text(
            'Laundry service made easy',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 24.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            'Are you a customer or a vendor? Give or receive laundry services easily',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w300, fontSize: 14.sp),
          ),
          SizedBox(height: 10.h),
          // const SvgImage(
          //   asset: bubbleContainerImage,
          // ),
          SizedBox(height: 10.h),
          ActionCustomButton(
              title: "Create account",
              isLoading: false,
              onclick: () {
               // Get.to(() => const SelectUserType());
              }),
          SizedBox(height: 10.h),
          ActionCustomButton(
              isOutline: true,
              btnColor: Colors.transparent,
              titleColor: AppColors.primary,
              title: "Login",
              isLoading: false,
              onclick: () {
                Get.to(() => LoginPage());
              }),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
