import 'package:opticash/providers/home_navigation_provider.dart';
import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/utils/images.dart';
import 'package:opticash/utils/svgs.dart';
import 'package:opticash/utils/user_db.dart';
import 'package:opticash/viewModels/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/views/authentication/logout.dart';
import 'package:opticash/views/home/home_page/widget/quick_action_widget.dart';
import 'package:opticash/widgets/image_widgets.dart';

import 'package:carousel_slider/carousel_slider.dart';

final hideAmountProvider = StateProvider<bool>((ref) => false);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Map<String, dynamic>> scrollData() {
    return [
      {
        "icon": earnIcon,
        "text": "Refer a friend and earn \$3 per referral",
        "color": AppColors.darkGreen
      },
      {
        "icon": payIcon,
        "text": "Refer a friend and earn \$3 per referral",
        "color": AppColors.darkBrown
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeViewModel);

    return Scaffold(body: mainComponent(viewModel: viewModel));
  }

  Widget mainComponent({required HomeViewModel viewModel}) {
    bool stateValue = ref.watch(hideAmountProvider);
    var toggleValue = ref.read(hideAmountProvider.notifier);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: generalHorizontalPadding),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              showLogout(context: context, ref: ref);
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20.r,
                              backgroundImage: const AssetImage(avatarIcon),
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, ${UserDB.getUser()!.firstName}',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp,
                                    ),
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                '${UserDB.getUser()!.email}',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CircleAvatar(
                                radius: 14.r,
                                backgroundColor:
                                    AppColors.gray4.withOpacity(0.3),
                                child: Center(
                                  child: Icon(
                                    Icons.refresh,
                                    size: 14.w,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                radius: 6,
                                backgroundColor: AppColors.red,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CircleAvatar(
                                radius: 14.r,
                                backgroundColor:
                                    AppColors.gray4.withOpacity(0.3),
                                child: Center(
                                  child: Icon(
                                    Icons.notification_important,
                                    size: 14.w,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: AppColors.red,
                                child: Center(
                                  child: Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headlineMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 6.sp,
                                            color: AppColors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 150.h,
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(walletBgImage), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.r),
                            color: AppColors.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ImageWidget(asset: d3LogoIcon),
                                Text(
                                  'Opticash Balance',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          color: AppColors.white),
                                ),
                                const SvgImage(asset: dropdownIcon)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          !stateValue ? '\$243,998' : "******",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.sp,
                                  color: AppColors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '123848492920304.234 (OPCH)',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9.sp,
                                  color: AppColors.lightGreen),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                          onTap: () {
                            toggleValue.state = !stateValue;
                          },
                          child: Icon(
                            !stateValue
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 140.h),
                  child: Container(
                    height: 80.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r)),
                        color: AppColors.secondary.withOpacity(0.1)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 8, right: 8, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          QuickActionWidget(
                              title: 'Send Money', icon: sendMoneyIcon),
                          QuickActionWidget(title: 'Top-Up', icon: topUpIcon),
                          QuickActionWidget(
                              title: 'Account Details',
                              icon: accountDetailsIcon)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20.h,
          ),

          // carousel
          CarouselSlider.builder(
            itemCount: scrollData().length,
            itemBuilder: (context, index, i) => Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 22 : 0, right: index == 1 ? 20 : 10),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 90.h,
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(carouselBgIcon), fit: BoxFit.fill),
                        color: scrollData()[index]["color"],
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageWidget(asset: scrollData()[index]["icon"]),
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              scrollData()[index]["text"],
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                height: 120.h,
                padEnds: false),
          ),
          SizedBox(
            height: 20.h,
          ),
          // transaction history
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
            child: Text(
              'Today, 26 june 2021',
              textAlign: TextAlign.start,
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
            child: Card(
              color: AppColors.lightGrey.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: ListTile(
                  isThreeLine: true,
                  minVerticalPadding: 17,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  leading: const ImageWidget(asset: nigeriaIcon),
                  title: Text(
                    'Transfer to James',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          // height: 2
                        ),
                  ),
                  subtitle: Row(
                    children: [
                      CircleAvatar(
                        radius: 3.w,
                        backgroundColor: AppColors.orange,
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Text(
                        'Pending',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: AppColors.orange),
                      ),
                    ],
                  ),
                  trailing: SizedBox(
                    width: 100.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          !stateValue ? '- N1.890' : ' ******',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: AppColors.red),
                        ),
                        Text(
                          '10th July 2023',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
