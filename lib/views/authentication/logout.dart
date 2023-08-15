import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:opticash/utils/user_db.dart';
import 'package:opticash/views/onboarding/onboarding_screen.dart';
import 'package:opticash/widgets/buttons.dart';
import 'package:opticash/widgets/dialog_widgets.dart';

class LogoutPage extends ConsumerWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        // color: Colors.red,
        height: 100.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Are you sure you want to logout?',
                  style: Theme.of(context).primaryTextTheme.headlineMedium),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextButton(
                      actionText: 'NO',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      onTap: () {
                        Get.back();
                      }),
                  const SizedBox(width: 70),
                  CustomTextButton(
                      actionText: 'YES',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      onTap: () async {
                        await UserDB.deleteUser();
                        Get.offAll(() => const OnboardingScreen());
                      }),
                ],
              )
            ],
          ),
        ));
  }
}

showLogout({required BuildContext context, required WidgetRef ref}) {
  return DialogWidgets.dialog(
      child: const LogoutPage(), title: "Logout", context: context);
}
