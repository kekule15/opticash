import 'package:opticash/providers/providers.dart';
import 'package:opticash/services/overlay_service.dart';
import 'package:opticash/viewModels/theme_provider.dart';
import 'package:opticash/widgets/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/utils/temporary_storage.dart';
import 'package:opticash/views/onboarding/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageManager.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeDataMode = ref.watch(themeDataProvider);
    ref.listen(loadingState.select((value) => value), (
      previous,
      current,
    ) {
      if (current) {
        OverlayService.showOverlay(context);
      } else {
        OverlayService.hideOverlay(context);
      }
    });
    return ScreenUtilInit(
        designSize: const Size(360, 700),
        builder: (widget, child) => LoadingOverlayWidget(
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Opticash',
                darkTheme: themeDataMode.isdarkTheme!
                    ? themeDataMode.darkTheme
                    : themeDataMode.lightTheme,
                themeMode: ThemeMode.system,
                theme: themeDataMode.isdarkTheme!
                    ? themeDataMode.darkTheme
                    : themeDataMode.lightTheme,
                home: const SplashView(),
              ),
            ));
  }
}
