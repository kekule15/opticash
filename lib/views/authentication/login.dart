import 'package:opticash/providers/user_auth_providers.dart';
import 'package:opticash/viewModels/user_auth_vm.dart';
import 'package:opticash/views/authentication/register.dart';
import 'package:opticash/views/authentication/widgets/custom_top_widget.dart';
import 'package:opticash/widgets/custom_appbar.dart';
import 'package:flutter/services.dart';
import 'package:opticash/style/appColors.dart';
import 'package:opticash/utils/constvalues.dart';
import 'package:opticash/widgets/buttons.dart';
import 'package:opticash/widgets/custom_button.dart';
import 'package:opticash/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

var selectUserTypeProvider = StateProvider.autoDispose<String>((ref) => '');

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authViewModel = ref.watch(customerAuthViewModelProvider);

    Widget loginForm(
        {required BuildContext context,
        required USerAuthViewModel authViewModel}) {
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
                    secondTextSize: 12.sp,
                    //underline: TextDecoration.underline,
                    textHeight: 2,
                    onTap: () {},
                    firstText: "Forgot password?",
                    secondText: ""),
              ),
              SizedBox(
                height: 20.h,
              ),
              ActionCustomButton(
                  title: "SIGN IN",
                  isLoading: false,
                  onclick: () {
                    FocusScope.of(context).unfocus();
                    final validate = authViewModel.validateAndSave(formKey);
                    if (validate) {
                      authViewModel.loginUser(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    }

                    //Get.to(() => const HomeNavigation());
                  }),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: WordsButton(
                    firstTextSize: 12.sp,
                    secondTextSize: 12.sp,
                    secondTextColor: AppColors.secondary,
                    fontWeight2: FontWeight.bold,
                    underline: TextDecoration.underline,
                    textHeight: 2,
                    onTap: () {
                       Get.to(() => Resgister());
                    },
                    firstText: "Don’t have an account?",
                    secondText: "Create Account"),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          const CustomTopWidget(
              textColor: AppColors.secondary,
              title: "Sign In",
              subtitle:
                  "Sign In to your account using your email \naddress and password",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: loginForm(context: context, authViewModel: authViewModel),
          ),
        ],
      ),
    );
  }
}
