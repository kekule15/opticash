

//  Widget customAppBar(
//     {required BuildContext context,
//     required String title,
//     required bool isTitled,
//     Color? textColor,}) {
//   return Row(
//     children: [
//       CustomIconButton.iconWithNoText(context, () {
//         Get.back();
//       }, Icons.arrow_back_ios,),
//        SizedBox(
//         width: 20.w,
//       ),
//       isTitled == true
//           ? Text(title,
//               textAlign: TextAlign.start,
//               style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16.sp,
//                   color: textColor??  Theme.of(context).primaryTextTheme.headlineMedium!.color))
//           : const SizedBox(),
//     ],
//   );
// }
