import 'package:opticash/style/appColors.dart';
import 'package:opticash/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTypeWidget extends ConsumerWidget {
  final String image;
  final String userType;
  final bool selected;

  UserTypeWidget(
      {required this.image,
      required this.userType,
      required this.selected,
      super.key});
  final selectedUser = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.w,
              color: selected
                  ? AppColors.secondary
                  : AppColors.lightGrey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.w),
        child: Column(
          children: [
            SvgImage(
              asset: image,
              height: 56.w,
              width: 80.w,
            ),
            SizedBox(height: 10.h),
            Text(
              userType,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
