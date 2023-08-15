import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:flutter/material.dart';

class DialogWidgets {
  static Future modalBottomSheetMenu(BuildContext context, Widget child,
      {dismiss = true,
      double? height,
      double? minHeight,
      bool isScrollControlled = true,
      bool showCancelButton = true,
      bool removeSpace = false}) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        isDismissible: dismiss,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(bottomSheetBorderRadius),
          ),
        ),
        builder: (builder) {
          return Container(
              constraints: BoxConstraints(
                minHeight: minHeight ?? bottomSheetHeight, //
              ),
              height: height ?? bottomSheetHeight,
              padding: const EdgeInsets.symmetric(
                  horizontal: generalHorizontalPadding, vertical: ySpace1),
              margin: isScrollControlled
                  ? EdgeInsets.only(
                      bottom: MediaQuery.of(builder).viewInsets.bottom,
                    )
                  : null,
              decoration: const BoxDecoration(
                 // color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(bottomSheetBorderRadius),
                      topRight: Radius.circular(bottomSheetBorderRadius))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showCancelButton)
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.white,
                              ))
                        ],
                      ),
                    Center(child: child),
                  ],
                ),
              ));
        });
  }



 
  static Future dialog(
      {required Widget child,
      required String title,
      required BuildContext context,
      bool? showHeader,}) {
  

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
        actionsPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        title: showHeader ==  true? Container(
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  topRight: Radius.circular(5.r))),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium
                  ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ):const SizedBox(),
        content: child);

    // show the dialog
    return showDialog(
      barrierDismissible: false,
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



}
