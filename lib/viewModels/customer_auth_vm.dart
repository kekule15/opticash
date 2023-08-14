
import 'package:opticash/providers/customer_auth_providers.dart';
import 'package:opticash/utils/notify_me.dart';
import 'package:opticash/utils/svgs.dart';
import 'package:opticash/utils/temporary_storage.dart';
import 'package:opticash/utils/user_db.dart';
import 'package:opticash/viewModels/base_vm.dart';
import 'package:opticash/views/home/navigation_page.dart';
import 'package:opticash/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class CustomerAuthViewModel extends BaseViewModel {
  @override
  final Ref ref;

  CustomerAuthViewModel(this.ref) : super(ref) {
    // getDeviceId();
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginPinController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final bvnController = TextEditingController();
  final otpController = TextEditingController();
  final dobController = TextEditingController();

  final firtNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final imageurlController = TextEditingController();



  String deviceId = '';
  final imagePicker = ImagePicker();

  bool isBiometric = false;
  switchBiometric() {
    isBiometric = !isBiometric;
    notifyListeners();
    return isBiometric;
  }

  bool obscureText = true;
  isObscure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  bool pinObscureText = true;
  pinObscure() {
    pinObscureText = !pinObscureText;
    notifyListeners();
  }




  Future login({required String email, required String password}) async {
    setBusy(true);
    final res = await ref
        .read(customerAuthServiceProvider)
        .loginCustomer(email, password);

    if (res.code == 200) {
      await UserDB.addProfile(res.data!);
      NotifyMe.showAlert(res.message!);
      Get.to(() => const HomeNavigation());
    } else {
      NotifyMe.showAlert(res.message!);
    }
    setBusy(false);
  }

  logout() async {
    Get.offAll(() => const OnboardingScreen());
    NotifyMe.showAlert('Logged out successfully');
    await UserDB.deleteUser();
  }

 
}
