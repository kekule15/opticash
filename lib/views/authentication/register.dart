import 'package:flutter/gestures.dart';
import 'package:opticash/providers/user_auth_providers.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/viewModels/user_auth_vm.dart';
import 'package:opticash/views/authentication/widgets/custom_top_widget.dart';
import 'package:opticash/widgets/buttons.dart';
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

class Resgister extends ConsumerWidget {
  Resgister({super.key});
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
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
            child: registerForm(
                context: context, authViewModel: authViewModel, ref: ref),
          ),
        ],
      ),
    );
  }

  Widget registerForm(
      {required BuildContext context,
      required USerAuthViewModel authViewModel,
      required WidgetRef ref}) {
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
              controller: firstNameController,
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
              controller: lastNameController,
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

                  // showConfirmDialog(context: context, ref: ref);
                  if (validate) {
                    authViewModel.registerUser(
                        context: context,
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
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
}
