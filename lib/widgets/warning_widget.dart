import 'package:opticash/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarningWidget extends ConsumerWidget {
  final String title;
  final Color bgColor;
  final Widget? trailing;
  final bool? hideLeading;
  final bool? hideTrailing;
  final double? width;
  final double? textWidth;
  final double? radius;
  final double? textSize;
  final double? contentPadding;

  const WarningWidget(
      {required this.title,
      required this.bgColor,
      this.trailing,
      this.hideLeading,
      this.hideTrailing,
      this.width,
      this.textWidth,
      this.radius,
      this.textSize,
      this.contentPadding,

      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width ?? 180.w,
      decoration: BoxDecoration(
          color: bgColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(radius ?? 8.r),
          border: Border.all(color: bgColor, width: 0.4)),
      child: Padding(
        padding:  EdgeInsets.all( contentPadding ??  10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Visibility(
                    visible: hideLeading == true ? false : true,
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: bgColor,
                          size: 14.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    )),
                SizedBox(
                  width: textWidth ?? 160.w,
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: textSize ?? 12.sp,
                        color: AppColors.black),
                  ),
                ),
              ],
            ),
            Visibility(
                visible: hideTrailing == true ? false : true,
                child: SizedBox(
                  child: trailing,
                ))
          ],
        ),
      ),
    );
  }
}
