import 'package:opticash/providers/user_auth_providers.dart';
import 'package:opticash/utils/logger.dart';
import 'package:opticash/utils/notify_me.dart';
import 'package:opticash/utils/user_db.dart';
import 'package:opticash/viewModels/base_vm.dart';
import 'package:opticash/views/authentication/widgets/confirm_dialog.dart';
import 'package:opticash/views/home/navigation_page.dart';
import 'package:opticash/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages

class USerAuthViewModel extends BaseViewModel {
  @override
  final Ref ref;

  USerAuthViewModel(this.ref) : super(ref) {
    // getDeviceId();
  }

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

  Future loginUser({required String email, required String password}) async {
    setBusy(true);
    final res =
        await ref.read(customerAuthServiceProvider).loginUser(email, password);
    AppLogger.logg("Response $res");
    if (res.status == 'success') {
      await UserDB.addProfile(res.data!.user!);
      NotifyMe.showAlert(res.status!);
      Get.to(() => const HomeNavigation());
    } else {
      NotifyMe.showAlert(res.status!);
    }
    setBusy(false);
  }

  Future registerUser(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    setBusy(true);
    final res = await ref.read(customerAuthServiceProvider).registerUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);

    AppLogger.logg("Response $res");

    if (res["status"] == "success") {
      NotifyMe.showAlert(res["data"]);
      if (context.mounted) showConfirmDialog(context: context);
    } else {
      NotifyMe.showAlert(res["data"]);
    }
    setBusy(false);
  }

  logout() async {
    Get.offAll(() => const OnboardingScreen());
    NotifyMe.showAlert('Logged out successfully');
    await UserDB.deleteUser();
  }
}
