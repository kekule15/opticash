import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opticash/providers/home_navigation_provider.dart';
import 'package:opticash/style/appColors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticash/utils/images.dart';
import 'package:opticash/utils/svgs.dart';
import 'package:opticash/viewModels/theme_provider.dart';
import 'package:opticash/views/home/home_page/home_view.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:opticash/widgets/image_widgets.dart';

class HomeNavigation extends ConsumerStatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeNavigation();
}

class _HomeNavigation extends ConsumerState<HomeNavigation> {
  final iconList = <String>[homeIcon, cardIcon, swapIcon, accountIcon];

  @override
  Widget build(BuildContext context) {
    Future<bool> onBackPressed() {
      return Future.delayed(const Duration(seconds: 2));
    }

    

    var pageIndexModel = ref.watch(pageIndexprovider);
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 8,
          backgroundColor: AppColors.secondary,
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: AppColors.secondary,
            child: const ImageWidget(
              asset: sendIcon,
            ),
          ),
          onPressed: () {
            //Get.to(() => const CoverageIntro());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconList[index],
                    color:  isActive
                            ? AppColors.primary
                            : AppColors.gray
                       ,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            );
          },
          activeIndex: pageIndexModel.currentIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: pageIndexModel.setIndex,

          //other params
        ),
        body: [
          const HomePage(),
          Container(),
          Container(),
          Container(),
        ][pageIndexModel.currentIndex],
      ),
    );
  }
}

final pageIndexprovider =
    ChangeNotifierProvider<MainIndexProvider>((ref) => MainIndexProvider(ref));

class MainIndexProvider extends ChangeNotifier {
  int currentIndex = 0;
  final Ref ref;

  MainIndexProvider(this.ref);

  setIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
