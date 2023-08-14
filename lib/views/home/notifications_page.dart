import 'package:opticash/style/appColors.dart';
import 'package:opticash/style/appCustomPaints.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/widgets/app_bar.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var keyboardVisible = MediaQuery.of(context).viewInsets.bottom == 0;
    return Scaffold(
       
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CustomPaint(
                size: Size(customPaintSizeValue,
                    (customPaintSizeValue * customPaintTop).toDouble()),
                painter: TopRightRPSCustomPainter(),
              ),
            ),
            keyboardVisible
                ? Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomPaint(
                      size: Size(
                          customPaintSizeValue,
                          (customPaintSizeValue * customPaintBottom)
                              .toDouble()),
                      painter: RPSCustomPainterNew(),
                    ),
                  )
                : const SizedBox(),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
                  child: customAppBar(
                    // context: context,
                    // title: 'Notifications',
                    // isTitled: true,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                noDataWidget()
              ],
            )
          ],
        ));
  }

  Widget noDataWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: ySpace3 * 3,
        ),
        const Center(
          child: Icon(
            Icons.campaign,
            size: 60,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(
          height: ySpace3,
        ),
        Text('You have no Notifications',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 17.sp)),
      ],
    );
  }
}
