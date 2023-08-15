import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/images.dart';
import 'package:opticash/views/authentication/login.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:opticash/widgets/dialog_widgets.dart';
import 'package:opticash/widgets/image_widgets.dart';

class ConfirmRegistrationDialog extends ConsumerWidget {
  const ConfirmRegistrationDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 250.h,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              asset: logoIcon,
              height: 80.w,
              width: 70.w,
            ),
            SizedBox(height: 10.h),
            Text(
              'Account Created \nSuccessfully ',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
            ),
            SizedBox(height: 20.h),
            ActionCustomButton(
                btnColor: AppColors.secondary,
                title: "SIGN IN",
                isLoading: false,
                onclick: () {
                  Get.to(() => LoginPage());
                }),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}

showConfirmDialog({required BuildContext context,}) {
  return DialogWidgets.dialog(
      child: const ConfirmRegistrationDialog(),
      title: "",
      showHeader: false,
      context: context,);
}
