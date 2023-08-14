import 'package:opticash/providers/home_navigation_provider.dart';
import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/utils/user_db.dart';
import 'package:opticash/viewModels/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeViewModel);

    return Scaffold(body: mainComponent(viewModel: viewModel));
  }

  Widget mainComponent({required HomeViewModel viewModel}) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hi, ${UserDB.getUser()?.firstName.toString().capitalizeFirst}',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp)),
            CircleAvatar(
              radius: 17.r,
              backgroundColor: AppColors.gray4,
             // backgroundImage: const AssetImage(augustusPic),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
       
       
        
      ],
    );
  }
}
