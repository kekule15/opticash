import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/style/appColors.dart';
import 'package:opticash/widgets/image_widgets.dart';

class QuickActionWidget extends ConsumerWidget {
  final String title;
  final String icon;
  const QuickActionWidget({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CircleAvatar(
          radius: 18.w,
          backgroundColor: AppColors.primary,
          child: Center(
            child: SvgImage(asset: icon),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
              ),
        ),
      ],
    );
  }
}
