import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleTextLineWidget extends ConsumerWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  const SingleTextLineWidget(
      {required this.text, this.size, this.weight, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
          fontSize: size ?? 12.sp, fontWeight: weight ?? FontWeight.w400),
    );
  }
}
