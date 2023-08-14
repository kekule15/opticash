import 'package:opticash/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextPaymentCardWidget extends ConsumerWidget {
  final bool hasItem;
  const NextPaymentCardWidget({required this.hasItem, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 140.w,
      height: 170.h,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 0.8.w, color: AppColors.lightGrey)),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: hasItem == true
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          mainAxisAlignment: hasItem == true
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Visibility(
                visible: hasItem == true ? false : true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   // const Center(child: SvgImage(asset: noCreditIcon)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "No credit collected ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 8.sp, fontWeight: FontWeight.w600),
                    )
                  ],
                )),
            Visibility(
                visible: hasItem == true ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next payment",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 11.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "N50,000",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 25.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "On Jun 12, 2023",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            border:
                                Border.all(color: AppColors.gray, width: 0.8.w),
                            borderRadius: BorderRadius.circular(7.r)),
                        child: Center(
                          child: Text(
                            'Make Payment',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineMedium!
                                .copyWith(
                                  color: AppColors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
