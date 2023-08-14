import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticash/viewModels/theme_provider.dart';

class ScaffoldOverider extends ConsumerWidget {
  final Widget child;
  const ScaffoldOverider({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeDataMode = ref.watch(themeDataProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeDataMode.isdarkTheme! ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            themeDataMode.isdarkTheme! ? Brightness.light : Brightness.dark,
      ),
      child: child,
    );
  }
}
