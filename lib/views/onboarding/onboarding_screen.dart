import 'dart:async';

import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/utils/images.dart';
import 'package:opticash/views/authentication/login.dart';
import 'package:opticash/views/authentication/register.dart';
import 'package:opticash/widgets/buttons.dart';
import 'package:opticash/widgets/custom_appbar.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:opticash/widgets/image_widgets.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int indexData = 0;
  int _currentPage = 0;
  late Timer? _timer;

  @override
  void initState() {
  
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 3) {
        setState(() {
          _currentPage++;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }

 
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: customAppBar(),
        body: Stack(
          children: [
            const Stack(
              alignment: Alignment.center,
              children: [
                ImageWidget(asset: splashBGImage),
                ImageWidget(asset: onboardingPeopleImage),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: onboardingWidget(context: context),
            )
          ],
        ));
  }

  Widget onboardingWidget({required BuildContext context}) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20.h),
        Text(
          'Send Money faster \nthan imagined',
          textAlign: TextAlign.start,
          style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 30.sp,
              color: AppColors.white),
        ),
        SizedBox(height: 10.h),
        Text(
          'Opticash provides you the fastest remittance to send and receive money!',
          textAlign: TextAlign.start,
          style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              color: AppColors.white),
        ),
        SizedBox(height: 30.h),
        Row(
          children: List.generate(
              3,
              (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 3.h,
                    width: MediaQuery.sizeOf(context).width / 6,
                    decoration: BoxDecoration(
                        color: _currentPage >= index
                            ? AppColors.primary
                            : AppColors.gray4),
                  ))),
        ),
        SizedBox(height: 30.h),
        ActionCustomButton(
            title: "Create New Account",
            btnColor: AppColors.primary,
            titleColor: AppColors.black,
            isLoading: false,
            onclick: () {
              Get.to(() => Resgister());
            }),
        SizedBox(height: 10.h),
        Center(
          child: WordsButton(
              firstTextSize: 12.sp,
              secondTextSize: 18.sp,
              underline: TextDecoration.underline,
              textHeight: 2,
              fontWeight2: FontWeight.bold,
              secondTextColor: AppColors.white,
              onTap: () {
                Get.to(() => LoginPage());
              },
              firstText: "",
              secondText: "Sign In"),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
