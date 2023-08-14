import 'package:opticash/utils/svgs.dart';
import 'package:opticash/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogoWidget extends ConsumerWidget {
  final Alignment? alignment;
  final double? height;
  final double? width;
  const AppLogoWidget({this.alignment, this.height, this.width, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: alignment ?? Alignment.topLeft,
      child: SvgImage(
        asset: bubblelogo,
        height: height ?? 56.w,
        width: width ?? 80.w,
      ),
    );
  }
}
