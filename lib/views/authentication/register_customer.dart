
import 'package:opticash/providers/customer_auth_providers.dart';
import 'package:opticash/widgets/buttons.dart';
import 'package:opticash/widgets/confirmation_screen.dart';
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomField(
                  headtext: "Name",
                  validate: true,
                  controller: fullNameController,
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: CustomField(
                  headtext: "Surname",
                  validate: true,
                  controller: userNameController,
                  textInputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            headtext: "Email",
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
            headtext: "Phone Number",
            hint: '+234-123456789',
            validate: true,
            controller: phoneController,
            textInputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[ ]')),
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.deny(RegExp('^0+')),
              LengthLimitingTextInputFormatter(11)
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            headtext: "Address",
            controller: referralController,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            headtext: "Password",
            hint: '***********',
            validate: true,
            controller: passwordController,
            textInputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[ ]')),
            ],
            obscureText: viewModel.obscureText,
            sIcon: InkWell(
                onTap: () {
                  viewModel.isObscure();
                },
                child: Icon(
                  viewModel.obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye,
                  size: 15.w,
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: WordsButton(
              secondTextSize: 12.sp,
              fontWeight2: FontWeight.w400,
              firstText: 'You agree to opticash',
              secondText: ' Terms and Conditions ',
              thirdText: " by creating an account ",
              underline: TextDecoration.underline,
              secondTextColor: AppColors.secondary,
              firstTextSize: 12.sp,
              thirdTextSize: 12.sp,
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ActionCustomButton(
              btnColor: AppColors.primary,
              title: "Signup",
              isLoading: false,
              onclick: () async {
               
              }),
          SizedBox(
            height: 15.h,
          ),
          Center(
            child: WordsButton(
                firstTextSize: 13.sp,
                secondTextSize: 13.sp,
                secondTextColor: AppColors.secondary,
                fontWeight2: FontWeight.bold,
                textHeight: 2,
                onTap: () {
                  Get.to(() => LoginPage());
                },
                firstText: "Have an existing account?",
                secondText: "Login"),
          ),
           SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
