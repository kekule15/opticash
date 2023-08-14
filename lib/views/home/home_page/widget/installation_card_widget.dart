import 'package:opticash/style/appColors.dart';
import 'package:opticash/widgets/buttons.dart';
import 'package:opticash/widgets/warning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstallationCardWidget extends ConsumerWidget {
  final bool hasItem;
  const InstallationCardWidget({required this.hasItem, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return 
    Container(
      width: 140.w,
      height: 170.h,
      decoration: BoxDecoration(
          color: AppColors.secondary, borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Installations",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontSize: 11.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "0",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.w700),
            ),
            const Spacer(
              flex: 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: hasItem == true ? false : true,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 35.h,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border:
                              Border.all(color: AppColors.gray, width: 0.8.w),
                          borderRadius: BorderRadius.circular(7.r)),
                      child: Center(
                        child: Text(
                          'Request Quote',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 10.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                )

                // IF installation has value
                ,
                Visibility(
                    visible: hasItem == true ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WarningWidget(
                          radius: 25.r,
                          width: 70,
                          textWidth: 60,
                          textSize: 8.sp,
                          contentPadding: 3.w,
                          title: "Coming soon!",
                          bgColor: AppColors.gray4.withOpacity(0.3),
                          hideLeading: true,
                          hideTrailing: true,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        IconTextButton(
                            title: "View site info",
                            icon: Icons.arrow_forward_outlined,
                            itemSpace: 10.w,
                            iconColor: AppColors.gray4,
                            textColor: AppColors.gray4,
                            onTap: () {})
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  
  
  }
}
