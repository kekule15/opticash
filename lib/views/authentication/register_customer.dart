import 'package:flutter/gestures.dart';
import 'package:opticash/providers/customer_auth_providers.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/viewModels/customer_auth_vm.dart';
import 'package:opticash/views/authentication/widgets/custom_top_widget.dart';
import 'package:opticash/widgets/buttons.dart';
import 'package:opticash/widgets/confirmation_screen.dart';
import 'package:opticash/widgets/custom_appbar.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:opticash/widgets/customfield.dart';
import 'package:flutter/services.dart';
import 'package:opticash/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/views/authentication/login.dart';
import 'package:get/get.dart';

class ResgisterCustomer extends ConsumerWidget {
  ResgisterCustomer({super.key});
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  final referralController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  // final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(customerAuthViewModelProvider);

    var authViewModel = ref.watch(customerAuthViewModelProvider);

    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          const CustomTopWidget(
              textColor: AppColors.secondary,
              title: "Create  Account",
              subtitle:
                  "Register a new account using your email address \nand fill in your informations",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: registerForm(context: context, authViewModel: authViewModel),
          ),
        ],
      ),
    );
  }

  Widget registerForm(
      {required BuildContext context,
      required CustomerAuthViewModel authViewModel}) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "First Name",
              validate: true,
              controller: emailController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Last Name",
              validate: true,
              controller: emailController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Email",
              hint: 'abc@gmail.com',
              validate: true,
              controller: emailController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Password",
              hint: "******",
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              controller: passwordController,
              validate: true,
              obscureText: authViewModel.obscureText,
              sIcon: InkWell(
                  onTap: () {
                    authViewModel.isObscure();
                  },
                  child: Icon(
                    authViewModel.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye,
                    size: 15.w,
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: WordsButton(
                  firstTextSize: 12.sp,
                  secondTextSize: 13.sp,
                  underline: TextDecoration.underline,
                  textHeight: 2,
                  fontWeight2: FontWeight.bold,
                  secondTextColor: AppColors.secondary,
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                  firstText: "Already have an account? ",
                  secondText: "Sign In"),
            ),
            SizedBox(
              height: 20.h,
            ),
            ActionCustomButton(
                title: "Create New Account",
                isLoading: false,
                onclick: () {
                  FocusScope.of(context).unfocus();
                  final validate = authViewModel.validateAndSave(formKey);
                  if (validate) {
                    authViewModel.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                  }

                  // Get.to(() => const HomeNavigation());
                }),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'By signing up you agree to our',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(
                        color: Colors.grey,
                      ),
                  children: [
                    TextSpan(
                      text: ' \nTerm of use ',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                            color: AppColors.secondary,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                            color: AppColors.secondary,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //   return Scaffold(
  //     body: ListView(
  //       children: [
  //         Form(
  //           key: formKey,
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 20.h,
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: CustomField(
  //                       headtext: "Name",
  //                       validate: true,
  //                       controller: fullNameController,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: 20.h,
  //                   ),
  //                   Expanded(
  //                     child: CustomField(
  //                       headtext: "Surname",
  //                       validate: true,
  //                       controller: userNameController,
  //                       textInputFormatters: [
  //                         FilteringTextInputFormatter.deny(RegExp('[ ]')),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 20.h,
  //               ),
  //               CustomField(
  //                 headtext: "Email",
  //                 validate: true,
  //                 controller: emailController,
  //                 textInputFormatters: [
  //                   FilteringTextInputFormatter.deny(RegExp('[ ]')),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 20.h,
  //               ),
  //               CustomField(
  //                 headtext: "Phone Number",
  //                 hint: '+234-123456789',
  //                 validate: true,
  //                 controller: phoneController,
  //                 textInputFormatters: [
  //                   FilteringTextInputFormatter.deny(RegExp('[ ]')),
  //                   FilteringTextInputFormatter.digitsOnly,
  //                   FilteringTextInputFormatter.deny(RegExp('^0+')),
  //                   LengthLimitingTextInputFormatter(11)
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 20.h,
  //               ),
  //               CustomField(
  //                 headtext: "Address",
  //                 controller: referralController,
  //               ),
  //               SizedBox(
  //                 height: 20.h,
  //               ),
  //               CustomField(
  //                 headtext: "Password",
  //                 hint: '***********',
  //                 validate: true,
  //                 controller: passwordController,
  //                 textInputFormatters: [
  //                   FilteringTextInputFormatter.deny(RegExp('[ ]')),
  //                 ],
  //                 obscureText: viewModel.obscureText,
  //                 sIcon: InkWell(
  //                     onTap: () {
  //                       viewModel.isObscure();
  //                     },
  //                     child: Icon(
  //                       viewModel.obscureText
  //                           ? Icons.visibility_off_outlined
  //                           : Icons.remove_red_eye,
  //                       size: 15.w,
  //                     )),
  //               ),
  //               SizedBox(
  //                 height: 20.h,
  //               ),
  //               Center(
  //                 child: WordsButton(
  //                   secondTextSize: 12.sp,
  //                   fontWeight2: FontWeight.w400,
  //                   firstText: 'You agree to opticash',
  //                   secondText: ' Terms and Conditions ',
  //                   thirdText: " by creating an account ",
  //                   underline: TextDecoration.underline,
  //                   secondTextColor: AppColors.secondary,
  //                   firstTextSize: 12.sp,
  //                   thirdTextSize: 12.sp,
  //                   onTap: () {},
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 20.h,
  //               ),
  //               ActionCustomButton(
  //                   btnColor: AppColors.primary,
  //                   title: "Signup",
  //                   isLoading: false,
  //                   onclick: () async {}),
  //               SizedBox(
  //                 height: 15.h,
  //               ),
  //               Center(
  //                 child: WordsButton(
  //                     firstTextSize: 13.sp,
  //                     secondTextSize: 13.sp,
  //                     secondTextColor: AppColors.secondary,
  //                     fontWeight2: FontWeight.bold,
  //                     textHeight: 2,
  //                     onTap: () {
  //                       Get.to(() => LoginPage());
  //                     },
  //                     firstText: "Have an existing account?",
  //                     secondText: "Login"),
  //               ),
  //               SizedBox(
  //                 height: 40.h,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );

  // }
}
