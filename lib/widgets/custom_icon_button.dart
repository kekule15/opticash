
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/style/appColors.dart';


class CustomIconButton {
  static iconWithNoText(
    BuildContext context,
    VoidCallback onPressed,
    IconData icon,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 26.w,
        width: 26.w,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: AppColors.gray,
                blurRadius: 0.3,
                spreadRadius: 0.3,
                offset: Offset(0.2, 0.3),
              ),
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle),
        child: Center(
            child: Icon(
                    icon,
                    size: 15.w,
                  )),
      ),
    );
  }
}
